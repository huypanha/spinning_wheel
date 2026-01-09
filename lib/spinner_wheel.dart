import 'package:flutter/material.dart';
import 'dart:math';
import '../core/animation_handler.dart';
import '../core/spin_calculations.dart';
import '../core/image_loader.dart';
import '../widgets/wheel_display.dart';
import '../models/wheel_segment.dart';
import '../controller/spin_controller.dart';

/// A customizable spinning wheel widget.
///
/// The [SpinnerWheel] allows you to create an interactive wheel with multiple
/// [WheelSegment]s. It supports custom backgrounds, center widgets, indicators,
/// and smooth spin animations controlled by a [SpinnerController].
class SpinnerWheel extends StatefulWidget {
  /// Controls the spin animation of the wheel.
  final SpinnerController controller;

  /// The list of segments (slices) to display on the wheel.
  final List<WheelSegment> segments;

  /// Callback called when the wheel stops spinning.
  /// Returns the selected [WheelSegment] and its index.
  final Function(WheelSegment, int) onComplete;

  /// An optional tint color applied to the default wheel background.
  final Color? wheelColor;

  /// The color of the default indicator.
  final Color? indicatorColor;

  /// A custom widget to display at the center of the wheel (e.g., a button or logo).
  final Widget? centerChild;

  /// A custom widget for the wheel's indicator (the "pointer").
  final Widget? indicator;

  /// The height of images displayed within segments.
  final double? imageHeight;

  /// The width of images displayed within segments.
  final double? imageWidth;

  /// The text style for labels displayed on each segment.
  final TextStyle? labelStyle;

  /// A custom background widget displayed behind the segments.
  final Widget? background;

  /// Whether to draw the default or provided background layer.
  final bool shouldDrawBackground;

  /// Creates a [SpinnerWheel].
  const SpinnerWheel({
    super.key,
    required this.controller,
    required this.segments,
    required this.onComplete,
    this.wheelColor,
    this.indicatorColor,
    this.centerChild,
    this.indicator,
    this.imageHeight,
    this.imageWidth,
    this.labelStyle,
    this.background,
    this.shouldDrawBackground = true,
  });

  @override
  State<SpinnerWheel> createState() => SpinnerWheelState();
}

/// The state of the [SpinnerWheel] which manages animations and image loading.
class SpinnerWheelState extends State<SpinnerWheel>
    with SingleTickerProviderStateMixin {
  /// The list of segments after their images have been loaded.
  List<WheelSegment> processedSegments = [];
  late AnimationController _controller;
  double _startRotation = 0.0, _endRotation = 0.0;

  @override
  void initState() {
    widget.controller.attachState(this);
    processSegments();
    _controller = createSpinController(this, () {
      setState(() {
        _startRotation = _endRotation % (2 * pi);
        int wheelIndex = determineSegment(widget.segments, _endRotation);
        widget.onComplete(widget.segments[wheelIndex], wheelIndex);
      });
    });
    super.initState();
  }

  /// Loads images for all segments asynchronously.
  void processSegments() async {
    processedSegments = await loadSegmentImages(widget.segments);
    if (mounted) {
      setState(() {});
    }
  }

  /// Programmatically starts the spin animation.
  Future<void> startSpin() async {
    _controller.reset();
    final result = spinWheel(_startRotation, widget.segments);
    setState(() {
      _endRotation = result.end;
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WheelDisplay(
      controller: _controller,
      segments: processedSegments,
      startRotation: _startRotation,
      endRotation: _endRotation,
      centerChild: widget.centerChild,
      indicator: widget.indicator,
      wheelColor: widget.wheelColor,
      indicatorColor: widget.indicatorColor,
      imageHeight: widget.imageHeight,
      imageWidth: widget.imageWidth,
      labelStyle: widget.labelStyle,
      background: widget.background,
      shouldDrawBackground: widget.shouldDrawBackground,
    );
  }
}
