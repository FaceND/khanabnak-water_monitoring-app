// Module
import 'package:flutter/material.dart';

// Model
import '../models/navbarModel.dart';

// Data
import '../data/navbar.dart';

// Service
import '../services/navbarService.dart';

AppBar navbar(BuildContext context, {String? title}) {
  return AppBar(
    backgroundColor: Colors.white,
    automaticallyImplyLeading: false,
    title: Row(
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              navigateToMain(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Image.asset(
                "assets/images/homepage/logo.png",
                fit: BoxFit.cover,
                height: 37,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            title ?? 'SSRU - Water Monitoring',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            overflow: TextOverflow.fade,
            maxLines: 5,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return navbars.map((Navigate item) {
                return PopupMenuItem<String>(
                  value: item.title,
                  child: Text(item.title),
                );
              }).toList();
            },
            onSelected: (String route) {
              navigateTo(context, route);
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
  );
}
