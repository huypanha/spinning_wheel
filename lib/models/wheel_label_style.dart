import 'package:flutter/material.dart';

/// Configuration for the segment labels' appearance and orientation.
class WheelLabelStyle {
  /// The text style for the label.
  final TextStyle? labelStyle;

  /// The additional rotation angle for the label text in radians.
  ///
  /// By default, labels are oriented outward from the center.
  /// Use this to tweak the alignment (e.g., pi/2 for perpendicular).
  final double angle;

  /// Creates a [WheelLabelStyle].
  const WheelLabelStyle({
    this.labelStyle,
    this.angle = 0.0,
  });
}
