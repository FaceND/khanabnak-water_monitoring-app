// Module
import 'package:flutter/material.dart';

// Model
import '../models/navbarModel.dart';

// Route
import '../routes/routing.service.dart';

List<Navigate> navbars = [
  Navigate(title: 'หน้าแรก', route: mainPath, icon: Icons.home),
  Navigate(title: 'คู่มือเรียนรู้', route: '/list-manual', icon: Icons.book),
  Navigate(title: 'เกี่ยวกับเรา', route: '/about-us', icon: Icons.info),
];
