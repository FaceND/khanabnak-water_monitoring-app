// Module
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:flutter/services.dart';

// Model
import 'package:khanabnak_water/model/dropdownNavModel.dart';
import 'package:khanabnak_water/model/detailModel.dart';

// Data
import '../data/khanabnak.dart';
import '../data/dropdownNav.dart';

// Service
import '../service/storageService.dart';
import '../service/runUrlService.dart';
import '../service/khanabnakService.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  BuildContext? dialogContext;
  late List<Detail> details;
  late Future<void> _dataFuture;
  late List<Map<String, dynamic>> detailsJson;

  @override
  void initState() {
    super.initState();
    _dataFuture = loadData();
  }

  Future<void> fetchAndSaveData() async {
    try {
      details = await fetchKhanabnakDetails();
      // await clearSharedPreferences();
      errorMessage = null;
      detailsJson = details.map((detail) => detail.toJson()).toList();
      setItem('khanabnakDetail', jsonEncode(detailsJson));
    } catch (e) {
      setState(() {
        errorMessage = '$e';
      });
    }
  }

  Future<void> loadData() async {
    String? getDataJson = await getItem('khanabnakDetail');
    if (getDataJson != null) {
      for (var detailJson
          in List<Map<String, dynamic>>.from(jsonDecode(getDataJson))) {
        var existingDetail = khanabnakDetailList.firstWhere(
          (detail) => detail.title == detailJson['title'],
          orElse: () => Detail(
            title: detailJson['title'],
            temp: 0.0,
            salinity: 0.0,
            electcon: 0,
            oxygen: 0,
            BOD: 0.0,
            measuringEquipment: 0,
            imagePath: '',
            url: '',
          ),
        );
        existingDetail.temp = detailJson['temp'].toDouble();
        existingDetail.salinity = detailJson['salinity'].toDouble();
        existingDetail.electcon = detailJson['electcon'];
        existingDetail.oxygen = detailJson['oxygen'];
        existingDetail.BOD = detailJson['BOD'].toDouble();
        existingDetail.measuringEquipment = detailJson['measuringEquipment'];
        existingDetail.imagePath = detailJson['imagePath'];
        existingDetail.url = detailJson['url'];
      }
      errorMessage = null;
      setState(() {});
    } else {
      await fetchAndSaveData();
      setState(() {});
    }
  }

  // Define a variable to hold the error message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Material(
                color: Colors.transparent,
                child: Image.asset(
                  "assets/images/homepage/logo.png",
                  fit: BoxFit.cover,
                  height: 37,
                ),
              ),
            ),
            const Text(
              'SSRU - Water Monitoring',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const Spacer(), // Add space to push the Icon to the right
            GestureDetector(
              onTap: () {},
              child: PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return dropdownNavList.map((DropdownNav item) {
                    return PopupMenuItem<String>(
                      value: item.page,
                      child: Text(item.page),
                    );
                  }).toList();
                },
                onSelected: (String choice) {
                  DropdownNav selectedNav =
                      dropdownNavList.firstWhere((nav) => nav.page == choice);
                  String selectedRoute = selectedNav.rounte;
                  if (ModalRoute.of(context)!.settings.name == selectedRoute) {
                    Navigator.pushReplacementNamed(context, selectedRoute);
                  } else {
                    Navigator.pushNamed(context, selectedRoute);
                  }
                },
                child: const Icon(
                  Icons.more_vert,
                  size: 27,
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
              ),
            )
          ],
        ),
      ),
      body: errorMessage != null
          ? Center(
              child: Builder(
                builder: (context) {
                  WidgetsBinding.instance!.addPostFrameCallback(
                    (_) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext alertContext) {
                          return AlertDialog(
                            content: Text(
                              errorMessage!,
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      // Close the dialog and exit the app
                                      Navigator.pop(alertContext);
                                      await clearStorage();
                                      SystemNavigator.pop(); // Close the app
                                    },
                                    child: const Text(
                                      'ปิด',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Close the dialog
                                      Navigator.pop(alertContext);
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext alertContext) {
                                          // Assign the dialog context
                                          dialogContext = context;
                                          return const AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                CircularProgressIndicator(
                                                  color: Color.fromARGB(
                                                      255, 241, 118, 174),
                                                ),
                                                SizedBox(height: 16),
                                                Text('กำลังโหลด...'),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      await Future.delayed(
                                          const Duration(seconds: 1));
                                      // After loading data, pop the dialog
                                      await loadData();
                                      if (dialogContext != null) {
                                        Navigator.pop(
                                            dialogContext!); // Close the dialog
                                      } else if (mounted) {
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text(
                                      'ลองอีกครั้ง',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 240, 73, 148)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                  return const SizedBox
                      .shrink(); // Prevents rendering anything else while showing the dialog
                },
              ),
            )
          : RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              displacement: 7,
              color: const Color.fromARGB(255, 241, 118, 174),
              onRefresh: () async {
                await fetchAndSaveData();
              },
              child: FutureBuilder(
                future: _dataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SkeletonAnimation(
                            shimmerColor: Colors.grey[300]!,
                            child: Container(
                              height: 220,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 238, 238, 238),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: <Widget>[
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: khanabnakDetailList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SkeletonAnimation(
                                      shimmerColor: Colors.grey[300]!,
                                      child: Container(
                                        height: 150,
                                        width: double.infinity,
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 16),
                                        decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 238, 238, 238),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error}',
                      ),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1.0,
                                  aspectRatio: 16 / 9,
                                  onPageChanged: (index, reason) {
                                    setState(() {});
                                  },
                                ),
                                items: topImagePaths.asMap().entries.map(
                                  (entry) {
                                    int index = entry.key;
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Stack(
                                          alignment: Alignment.center,
                                          children: <Widget>[
                                            ColorFiltered(
                                              colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.6),
                                                BlendMode.darken,
                                              ),
                                              child: SizedBox(
                                                height: double.infinity,
                                                width: double.infinity,
                                                child: Image.asset(
                                                  entry.value,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 20.0,
                                              left: 0.0,
                                              right: 0.0,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    headcaptions[index],
                                                    style: const TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                      fontFamily: 'Kanit',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    captions[index],
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                      fontFamily: 'Kanit',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ).toList(),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: <Widget>[
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(), // This disables scrolling for the ListView
                                  // itemCount: khanabnakDetailList.length,
                                  itemCount: khanabnakDetailList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        margin: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 16),
                                        child: Card(
                                          semanticContainer: true,
                                          borderOnForeground: true,
                                          elevation: 0.0,
                                          shadowColor: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: IntrinsicHeight(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .stretch, // to stretch vertically
                                              children: [
                                                Container(
                                                  width: 125,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          khanabnakDetailList[
                                                                  index]
                                                              .imagePath),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        16, 5, 10, 16),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          khanabnakDetailList[
                                                                  index]
                                                              .title,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    196,
                                                                    69,
                                                                    105),
                                                            fontFamily: 'Kanit',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 7),
                                                        Text(
                                                          'อุณหภูมิ          ${khanabnakDetailList[index].temp.toString()} ºC',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    220,
                                                                    51,
                                                                    51,
                                                                    51),
                                                            fontFamily: 'Kanit',
                                                          ),
                                                        ),
                                                        Text(
                                                          'ความเค็ม         ${khanabnakDetailList[index].salinity.toString()} ppt',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromARGB(
                                                                    220,
                                                                    51,
                                                                    51,
                                                                    51),
                                                            fontFamily: 'Kanit',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 7),
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              '${khanabnakDetailList[index].measuringEquipment.toString()}  อุปกรณ์ตรวจวัด',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Color
                                                                    .fromARGB(
                                                                        220,
                                                                        51,
                                                                        51,
                                                                        51),
                                                                fontFamily:
                                                                    'Kanit',
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    runUrl(khanabnakDetailList[
                                                                            index]
                                                                        .url);
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'รายละเอียด',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          11,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          0,
                                                                          123,
                                                                          255),
                                                                      fontFamily:
                                                                          'Kanit',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
    );
  }
}
