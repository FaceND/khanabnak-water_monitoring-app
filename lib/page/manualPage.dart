// Module
import 'package:flutter/material.dart';

// Model
import 'package:khanabnak_water/model/dropdownNavModel.dart';

// Service
import '../service/runUrlService.dart';

// Data
import 'package:khanabnak_water/data/manual.dart';
import '../data/dropdownNav.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({super.key});

  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
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
                    Navigator.of(context)
                        .popUntil((route) => route.settings.name == '/');
                    Navigator.pushNamed(context, mainRounte);
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
                  } else if (selectedRoute == mainRounte) {
                    Navigator.of(context)
                        .popUntil((route) => route.settings.name == '/');
                    Navigator.pushNamed(context, selectedRoute);
                  } else {
                    Navigator.pushNamedAndRemoveUntil(context, selectedRoute,
                        ModalRoute.withName(mainRounte));
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: <Widget>[
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'ค้นหาคู่มือ...',
              //     prefixIcon: const Icon(
              //       Icons.search,
              //       color: Color.fromARGB(255, 196, 69, 105),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(28),
              //       borderSide: const BorderSide(
              //         color: Color.fromARGB(155, 196, 69, 105),
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(28),
              //       borderSide: const BorderSide(
              //         color: Color.fromARGB(255, 196, 69, 105),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 25),
              ListView.builder(
                shrinkWrap: true,
                itemCount: manualList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: manualList[index].color,
                    elevation: 15,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListTile(
                      onTap: () {
                        runUrl(manualList[index].url);
                      },
                      title: Center(
                        child: Text(
                          manualList[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
