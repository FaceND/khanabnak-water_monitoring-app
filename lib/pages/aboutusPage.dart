// Module
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// Data
import '../data/aboutus.dart';

// Component
import '../components/navbar.component.dart';

class AboutusPage extends StatefulWidget {
  const AboutusPage({super.key});

  @override
  State<StatefulWidget> createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutusPage> {
  int _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    const TextStyle aboutusSubtextStyle = TextStyle(
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
      appBar: navbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: topImagePaths.length,
              itemBuilder: (
                BuildContext context,
                int index,
                int pageViewIndex,
              ) {
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
                            headCaptions[index],
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
                                  subCaptions1[index],
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
                                  subCaptions2[index],
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
                  children: <Widget>[
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
                children: <Widget>[
                  ColoredBox(
                    color: Color.fromARGB(255, 65, 105, 225),
                    child: SizedBox(
                      child: ListTile(
                        contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 15),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
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
                                children: <Widget>[
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
                                          style: aboutusSubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Icon(
                                        Icons.circle,
                                        size: 6,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "ตรวจสอบคุณภาพน้ำของคุณ ได้ง่าย ผ่านเว็ปเบราเซอร์ และหรือแอพพลิเคชั่น",
                                          style: aboutusSubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Icon(Icons.circle,
                                          size: 6, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "เลือกติดตั้งหน่วยวัดคุณภาพน้ำในแต่ละด้านที่ต้องการ ในงบประมาณที่ควบคุมได้",
                                          style: aboutusSubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Icon(Icons.circle,
                                          size: 6, color: Colors.white),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "รองรับการใช้งานหลากหลายโครงการ สถานีตรวจวัด (จุดติดตั้ง) และ อุปกรณ์ตรวจวัดคุณภาพน้ำ พร้อมๆกัน",
                                          style: aboutusSubtextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: <Widget>[
                                      Icon(
                                        Icons.circle,
                                        size: 6,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "สะดวก ปลอดภัย เลือกการเปิดเผยข้อมูลคุณภาพน้ำของคุณ ให้เป็น สาธารณะ หรือ ส่วนบุคคล ได้",
                                          style: aboutusSubtextStyle,
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: aboutUsProducts.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage(
                          aboutUsProducts[index].image!,
                        ),
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                        child: Text(
                          aboutUsProducts[index].subtitle!,
                          style: bottomContainertextStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 25,
              ),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _currentImageIndex = index;
                          },
                        );
                      },
                    ),
                    items: bottomImagePaths.map(
                      (imagePath) {
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
                      },
                    ).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bottomImagePaths.asMap().entries.map(
                      (entry) {
                        int index = entry.key;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.0,
                            vertical: 15,
                          ),
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
                      },
                    ).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
