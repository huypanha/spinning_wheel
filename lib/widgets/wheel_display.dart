import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spinning_wheel/widgets/wheel_painter.dart';
import '../models/wheel_segment.dart';
import 'indicator.dart';

class WheelDisplay extends StatelessWidget {
  final AnimationController controller;
  final List<WheelSegment> segments;
  final double startRotation;
  final double endRotation;
  final Widget? centerChild;
  final Widget? indicator;
  final Color? wheelColor;
  final Color? indicatorColor;
  final double? imageHeight;
  final double? imageWidth;
  final TextStyle? labelStyle;
  final double minSize;
  final double maxSize;
  final double aspectRatio;
  final ImageProvider? backgroundImage;

  const WheelDisplay({
    super.key,
    required this.controller,
    required this.segments,
    required this.startRotation,
    required this.endRotation,
    this.centerChild,
    this.indicator,
    this.wheelColor,
    this.indicatorColor,
    this.imageHeight,
    this.imageWidth,
    this.labelStyle,
    this.minSize = 100.0,
    this.maxSize = double.infinity,
    this.aspectRatio = 1.0,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate responsive size with constraints
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        // Respect aspect ratio while fitting within constraints
        double targetSize = min(availableWidth, availableHeight / aspectRatio);
        targetSize = targetSize.clamp(minSize, maxSize);

        // Ensure the widget fits within the available space
        double finalWidth = min(targetSize, availableWidth);
        double finalHeight = min(targetSize * aspectRatio, availableHeight);
        double size = min(finalWidth, finalHeight);

        return SizedBox(
          width: constraints.maxWidth == double.infinity ? size : null,
          height: constraints.maxHeight == double.infinity ? size : null,
          child: Center(
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: SizedBox(
                width: size,
                height: size,
                child: _buildWheel(size),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWheel(double size) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Main wheel container
        Stack(
          alignment: Alignment.center,
          children: [
            // Wheel background image
            SizedBox(
              width: size,
              height: size,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image(
                  image: backgroundImage ??
                      const AssetImage('assets/wheel.png',
                          package: 'spinning_wheel'),
                  fit: BoxFit.contain,
                  color: wheelColor,
                ),
              ),
            ),
            // Rotating wheel content
            SizedBox(
              width: size,
              height: size,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: Tween(begin: startRotation, end: endRotation)
                        .animate(
                          CurvedAnimation(
                            parent: controller,
                            curve: Curves.easeOutCirc,
                          ),
                        )
                        .value,
                    child: Padding(
                      padding: EdgeInsets.all(size * 0.094),
                      child: CustomPaint(
                        size: Size(size, size),
                        painter: WheelPainter(
                          segments,
                          imageHeight: imageHeight ?? (size * 0.11),
                          imageWidth: imageWidth ?? (size * 0.11),
                          style: _getResponsiveLabelStyle(size),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        // Indicator
        _buildIndicator(size),
        // Center button
        _buildCenterButton(size),
      ],
    );
  }

  Widget _buildIndicator(double size) {
    return Positioned(
      top: size * 0.02, // More responsive positioning
      child: indicator ??
          ClipPath(
            clipper: TriangleBottomClipper(),
            child: Container(
              width: size * 0.03,
              height: size * 0.15,
              decoration: BoxDecoration(
                color: indicatorColor ?? Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: size * 0.01,
                    spreadRadius: size * 0.002,
                    offset: Offset(0, size * 0.005),
                  ),
                ],
              ),
              child: Center(
                child: Container(
                  width: size * 0.015,
                  height: size * 0.015,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
    );
  }

  Widget _buildCenterButton(double size) {
    return Container(
      width: size * 0.12,
      height: size * 0.12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.grey],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: size * 0.01,
            spreadRadius: size * 0.002,
          ),
        ],
      ),
      child: centerChild ??
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.radio_button_checked,
                color: Colors.redAccent,
                size: size * 0.08, // Slightly smaller for better proportion
              ),
            ),
          ),
    );
  }

  TextStyle? _getResponsiveLabelStyle(double size) {
    if (labelStyle != null) return labelStyle;

    // Provide a default responsive text style
    return TextStyle(
      fontSize: size * 0.025, // Responsive font size
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }
}
