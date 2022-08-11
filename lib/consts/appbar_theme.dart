import 'package:flutter/material.dart';

var container = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.red[900]!,
      Colors.blue[700]!,
      Colors.black,
    ],
    stops: const [0.0, 0.7, 0.9],
    begin: const FractionalOffset(0.0, 0.0),
    end: const FractionalOffset(1.0, 0.0),
    tileMode: TileMode.mirror,
    transform: const GradientRotation(5.1 / 2),
  ),
);
