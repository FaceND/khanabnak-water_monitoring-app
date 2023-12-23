// Module
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutmePage extends StatefulWidget {
  const AboutmePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AboutmePageState();
}

class _AboutmePageState extends State<AboutmePage> {
  final List<String> topImagePaths = [
    "assets/images/homepage/homepage_slide1.jpg",
    "assets/images/homepage/homepage_slide2.jpg",
    "assets/images/homepage/homepage_slide3.jpg",
  ];

  final List<String> bottomImagePaths = [
    "assets/images/homepage/image_bottom1.jpg",
    "assets/images/homepage/image_bottom2.jpg",
    "assets/images/homepage/image_bottom3.jpg",
    "assets/images/homepage/image_bottom4.jpg",
    "assets/images/homepage/image_bottom5.jpg",
    "assets/images/homepage/image_bottom6.jpg",
    "assets/images/homepage/image_bottom7.jpg",
    "assets/images/homepage/image_bottom8.jpg",
    "assets/images/homepage/image_bottom9.jpg",
    "assets/images/homepage/image_bottom10.jpg",
  ];

  final List<String> headcaptions = [
    "Water",
    "Water pollution",
    "Water quality monitoring",
  ];

  final List<String> captions1 = [
    "น้ำเป็นปัจจัยที่สำคัญของสิ่งมีชีวิต การเพิ่มของประชากร การขยายตัวของชุมชนเมือง และการพัฒนาทางด้านอุตสาหกรรม",
    "มลพิษทางน้ำ คือ การปนเปื้อนของแหล่งน้ำ สาเหตุส่วนใหญ่เกิดจากการใช้ประโยชน์จากกิจกรรมต่างๆของมนุษย์",
    "การตรวจสอบคุณภาพน้ำเป็นพื้นฐานของการจัดการน้ำอย่างยั่งยืน",
  ];

  final List<String> captions2 = [
    "มีผลทำให้มีการใช้น้ำปริมาณมาก ได้ก่อให้เกิดปัญหาคุณภาพน้ำ และ แม่น้ำลำคลอง และชายฝั่งทะเล รวมถึงความเป็นอยู่ของมนุษย์",
    "ทั้งน้ำทิ้งจากแหล่งชุมชน และโรงงานอุตสาหกรรม ทำให้คุณภาพของน้ำเปลี่ยนแปลงไปในทางที่เสื่อมโทรมลง ยังผลให้การใช้ประโยชน์จากน้ำนั้นไม่ได้",
    "ให้ข้อมูลที่จำเป็น ซึ่งระบุลักษณะทางกายภาพ เคมี และหรือสถานะทางชีววิทยาของทรัพยากรน้ำ",
  ];

  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    const TextStyle aboutWhySubtextStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontFamily: 'Kanit',
    );

    const TextStyle bottomContainertextStyle = TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 15,
      fontFamily: 'Kanit',
    );
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
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const MyHomePage(),
                    //   ),
                    // );
                  },
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
              onTap: () {},
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
                    Navigator.pushNamed(context, '/detail');
                  } else if (choice == 'เกี่ยวกับเรา') {
                    Navigator.pushReplacementNamed(context, '/aboutme');
                  }
                },
                child: const Icon(
                  Icons.more_vert,
                  size: 27,
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: topImagePaths.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6),
                        BlendMode.darken,
                      ),
                      child: Image.asset(
                        topImagePaths[index],
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          title: Text(
                            headcaptions[index],
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Kanit',
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              Center(
                                child: Text(
                                  captions1[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Kanit',
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  captions2[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Kanit',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 16 / 9,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(30.0),
                title: Image.asset(
                  "assets/images/homepage/homepage_card-body.jpg",
                  fit: BoxFit.cover,
                ),
                subtitle: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'คุณภาพน้ำตำบลขนาบนาก อ.ปากพนัง',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 196, 69, 105),
                          fontFamily: 'Kanit',
                        ),
                      ),
                    ),
                    // Text(
                    //   'Water quality in Khanabnak Sub-district, Pakphanang District, Nakhon Si Thammarat Province.',
                    //   style: TextStyle(
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.w400,
                    //     color: Color.fromARGB(255, 108, 116, 125),
                    //     fontFamily: 'Kanit',
                    //   ),
                    // ),
                    Text(
                      'โดย 4 สถานีตรวจวัด',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 0, 123, 255),
                        fontFamily: 'Kanit',
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ColoredBox(
                    color: Color.fromARGB(255, 65, 105, 225),
                    child: SizedBox(
                      // width: double.infinity,
                      // height: MediaQuery.of(context).size.height * .7 - kToolbarHeight + (MediaQuery.of(context).orientation
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 15),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'เกี่ยวกับเรา',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Kanit',
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'SSRU - Water Monitoring ระบบตรวจวัดและเฝ้าระวังคุณภาพน้ำออนไลน์ พัฒนาขึ้นเพื่อรองรับการใช้งานสาธารณะทั้ง กิจการภาครัฐ และเอกชน',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Kanit',
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'ทำไมต้อง SSRU-Water Monitoring',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Kanit',
                              ),
                            ),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Icon(Icons.circle,
                                          size: 6, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "ตรวจวัดและเฝ้าระวังคุณภาพน้ำของคุณ ในรูปแบบออนไลน์",
                                          style: aboutWhySubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Icon(Icons.circle,
                                          size: 6, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "ตรวจสอบคุณภาพน้ำของคุณ ได้ง่าย ผ่านเว็ปเบราเซอร์ และหรือแอพพลิเคชั่น",
                                          style: aboutWhySubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Icon(Icons.circle,
                                          size: 6, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "เลือกติดตั้งหน่วยวัดคุณภาพน้ำในแต่ละด้านที่ต้องการ ในงบประมาณที่ควบคุมได้",
                                          style: aboutWhySubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Icon(Icons.circle,
                                          size: 6, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "รองรับการใช้งานหลากหลายโครงการ สถานีตรวจวัด (จุดติดตั้ง) และ อุปกรณ์ตรวจวัดคุณภาพน้ำ พร้อมๆกัน",
                                          style: aboutWhySubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Icon(Icons.circle,
                                          size: 6, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "สะดวก ปลอดภัย เลือกการเปิดเผยข้อมูลคุณภาพน้ำของคุณ ให้เป็น สาธารณะ หรือ ส่วนบุคคล ได้",
                                          style: aboutWhySubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                title: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "จุดเด่นของสินค้าและบริการ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 33, 37, 41),
                      fontFamily: 'Kanit',
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "เรามอบโซลูชั่นที่ครบวงจร ตั้งแต่การติดตั้ง ถึงการดูแลรักษา ให้กับคุณ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(225, 33, 37, 41),
                        fontFamily: 'Kanit',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Image(
                    image:
                        AssetImage("assets/images/homepage/icon_quality.png"),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                    child: Text(
                      "แสดงผลคุณภาพน้ำของคุณ ในรูปแบบ Real-Time",
                      style: bottomContainertextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/homepage/icon_graph.png"),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                    child: Text(
                      "ข้อมูลย้อนหลัง ในรูปแบบกราฟและตารางข้อมูล เพื่อดูแนวโน้มคุณภาพน้ำของคุณ",
                      style: bottomContainertextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Column(
                children: [
                  Image(
                    image: AssetImage("assets/images/homepage/icon_warn.png"),
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                    child: Text(
                      "แจ้งเตือนเมื่อค่าคุณภาพน้ำแต่ละด้านสูงหรือต่ำกว่าค่าที่กำหนด และแจ้งเตือนเมื่อถึงเวลากำหนดการบำรุงรักษา",
                      style: bottomContainertextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Column(children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                  ),
                  items: bottomImagePaths.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: bottomImagePaths.asMap().entries.map((entry) {
                    int index = entry.key;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 15),
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentImageIndex == index
                              ? const Color.fromARGB(255, 148, 148, 148)
                              : const Color.fromARGB(255, 214, 214, 214),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
