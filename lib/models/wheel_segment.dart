import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class WheelSegment {
  final String label;
  final Color color;
  final int value;
  final String? path;
  final ui.Image? image;
  final double? probability;

  WheelSegment(this.label, this.value,
      {Color? color, this.path, this.image, this.probability})
      : color = color ??
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
