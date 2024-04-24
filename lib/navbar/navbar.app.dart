// Module
import 'package:flutter/material.dart';

// Model
import '../models/navbar.model.dart';

// Route
import '../routes/routing.service.dart';

List<Navigate> navbars = [
  Navigate(route: mainPath, title: 'หน้าแรก', icon: Icons.home),
  Navigate(route: '/list-manual', title: 'คู่มือเรียนรู้', icon: Icons.book),
  Navigate(route: '/about-us', title: 'เกี่ยวกับเรา', icon: Icons.info),
];
