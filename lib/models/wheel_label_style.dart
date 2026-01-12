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

  /// How visual overflow should be handled.
  final TextOverflow overflow;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  final int? maxLines;

  /// Creates a [WheelLabelStyle].
  const WheelLabelStyle({
    this.labelStyle,
    this.angle = 0.0,
    this.overflow = TextOverflow.clip,
    this.maxLines = 1,
  });
}
