// Module
import 'package:flutter/material.dart';

// Data
import '../data/manual.dart';

// Component
import '../components/navbar.component.dart';

class ListManualPage extends StatefulWidget {
  const ListManualPage({super.key});

  @override
  State<ListManualPage> createState() => _ListManualPageState();
}

class _ListManualPageState extends State<ListManualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: navbar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: manualList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  elevation: 5,
                  child: InkWell(
                    splashColor: manualList[index].color,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/manual',
                        arguments: {
                          'manualData': manualList[index],
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 30.0),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                      flex: 10,
                                      child: Text(
                                        manualList[index].title,
                                        style: const TextStyle(
                                          fontSize: 19.5,
                                          color:
                                              Color.fromARGB(255, 40, 40, 40),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: manualList[index].color,
                                  width: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
