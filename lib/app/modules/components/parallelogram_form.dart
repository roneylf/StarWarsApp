import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ParallelogramClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.05, size.height * 0.13);
    path.lineTo(size.width * 0.80, size.height * 0.13);
    path.lineTo(size.width * 0.95, size.height * 0.87);
    path.lineTo(size.width * 0.20, size.height * 0.87);
    path.lineTo(size.width * 0.05, size.height * 0.13);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
