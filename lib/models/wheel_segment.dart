import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

/// Represents a single slice or segment of the spinning wheel.
class WheelSegment {
  /// The text displayed on the segment.
  final String label;

  /// The background color of the segment.
  /// If not provided, a random color is selected.
  final Color color;

  /// The numeric value associated with this segment (e.g., prize amount).
  final int value;

  /// The path to an image icon displayed on the segment.
  /// Supports both local asset paths and network URLs.
  final String? path;

  /// The loaded [ui.Image] object, usually populated by the loader.
  final ui.Image? image;

  /// Weighted probability for this segment to be selected (0.0 to 1.0).
  /// If null, it defaults to equal distribution sharing the remaining probability.
  final double? probability;

  /// Creates a new [WheelSegment].
  WheelSegment(
    this.label,
    this.value, {
    Color? color,
    this.path,
    this.image,
    this.probability,
  }) : color = color ??
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
}
