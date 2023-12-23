// Module
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeleton_text/skeleton_text.dart';

// Data
import '../data/khanabnak.dart';

// Service
import '../service/runUrlService.dart';
import '../service/khanabnakService.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<void> fetchDataFuture;

  @override
  void initState() {
    super.initState();
    fetchDataFuture = fetchData();
  }

  Future<void> fetchData() async {
    await fetchKhanabnakDetails();
    setState(() {}); // Trigger a rebuild
  }

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
                child: InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     // MaterialPageRoute(
                  //     //   // builder: (context) => const MyHomePage(),
                  //     // ),
                  //   );
                  // },
                  child: Image.asset(
                    "assets/images/homepage/logo.png",
                    fit: BoxFit.cover,
                    height: 37,
                  ),
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
              onTap: () {
                // Handle the button click here
              },
              child: PopupMenuButton<String>(
                itemBuilder: (BuildContext context) {
                  return ['หน้าแรก', 'เกี่ยวกับเรา'].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
                onSelected: (String choice) {
                  if (choice == 'หน้าแรก') {
                    Navigator.pushReplacementNamed(context, '/detail');
                  } else if (choice == 'เกี่ยวกับเรา') {
                    Navigator.pushNamed(context, '/aboutme');
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
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        displacement: 7,
        color: const Color.fromARGB(255, 241, 118, 174),
        onRefresh: () async {
          await fetchData();
        },
        child: FutureBuilder(
          future: fetchDataFuture,
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
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: khanabnakDetailList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SkeletonAnimation(
                                shimmerColor: Colors.grey[300]!,
                                child: Container(
                                  height: 150,
                                  width: double.infinity,
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 16),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    // borderRadius: BorderRadius.circular(8.0),
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
                child: Text('${snapshot.error}'),
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
                          items: topImagePaths.asMap().entries.map((entry) {
                            int index = entry.key;
                            return Builder(
                              builder: (BuildContext context) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: [
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
                                        children: [
                                          Text(
                                            headcaptions[index],
                                            style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
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
                                              fontWeight: FontWeight.w500,
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
                          }).toList(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(), // This disables scrolling for the ListView
                            itemCount: khanabnakDetailList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 16),
                                  child: Card(
                                    semanticContainer: true,
                                    borderOnForeground: true,
                                    elevation: 0.0,
                                    shadowColor:
                                        const Color.fromARGB(255, 0, 0, 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
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
                                                    khanabnakDetailList[index]
                                                        .imagePath),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16, 5, 10, 16),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    khanabnakDetailList[index]
                                                        .title,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromARGB(
                                                          255, 196, 69, 105),
                                                      fontFamily: 'Kanit',
                                                    ),
                                                  ),
                                                  const SizedBox(height: 7),
                                                  Text(
                                                    'อุณหภูมิ          ${khanabnakDetailList[index].temp.toString()} ºC',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromARGB(
                                                          220, 51, 51, 51),
                                                      fontFamily: 'Kanit',
                                                    ),
                                                  ),
                                                  Text(
                                                    'ความเค็ม         ${khanabnakDetailList[index].salinity.toString()} ppt',
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color.fromARGB(
                                                          220, 51, 51, 51),
                                                      fontFamily: 'Kanit',
                                                    ),
                                                  ),
                                                  const SizedBox(height: 7),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${khanabnakDetailList[index].measuringEquipment.toString()}  อุปกรณ์ตรวจวัด',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Color.fromARGB(
                                                              220, 51, 51, 51),
                                                          fontFamily: 'Kanit',
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              runUrl(
                                                                  khanabnakDetailList[
                                                                          index]
                                                                      .url);
                                                            },
                                                            child: const Text(
                                                              'รายละเอียด',
                                                              style: TextStyle(
                                                                fontSize: 11,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Color
                                                                    .fromARGB(
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
