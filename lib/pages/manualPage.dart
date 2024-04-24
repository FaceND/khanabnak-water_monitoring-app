// Module
import 'package:flutter/material.dart';

// Model
import '../models/manual.model.dart';

// Component
import '../components/navbar.component.dart';

class ManualPage extends StatefulWidget {
  final Manual manualData;
  
  const ManualPage({super.key, required this.manualData});

  @override
  State<ManualPage> createState() => _ManualPageState();
}

class _ManualPageState extends State<ManualPage> {
  final double paddingList = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: navbar(context, title: widget.manualData.title),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: widget.manualData.color,
              width: double.infinity,
              height: 275,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.manualData.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.manualData.row.length, // Row Length
              itemBuilder: (BuildContext context, int rowIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: paddingList),
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              widget.manualData.column.length, // Column Length
                          itemBuilder: (BuildContext context, int columnIndex) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // <-------------------- Left Column -------------------->
                                  Flexible(
                                    flex:
                                        2, // Set flex factor to 2 for the first column
                                    child: columnIndex == 0
                                        ? Text(
                                            widget
                                                .manualData.column[columnIndex],
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: widget.manualData.color,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 4,
                                          )
                                        : Text(
                                            widget
                                                .manualData.column[columnIndex],
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 4,
                                          ),
                                  ),
                                  // <-------------------- Right Column -------------------->
                                  Flexible(
                                    flex:
                                        2, // Set flex factor to 2 for the second column
                                    child: columnIndex == 0
                                        ? Text(
                                            widget.manualData.row[rowIndex]
                                                [columnIndex],
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: widget.manualData.color),
                                            textAlign: TextAlign.end,
                                            maxLines: 4,
                                          )
                                        : Text(
                                            widget.manualData.row[rowIndex]
                                                [columnIndex],
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.end,
                                            maxLines: 4,
                                          ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: paddingList), // Add padding below the last Card
            )
          ],
        ),
      ),
    );
  }
}
