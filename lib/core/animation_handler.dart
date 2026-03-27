import 'package:flutter/material.dart';

/// Creates the [AnimationController] responsible for the 5-second spin duration.
///
/// Triggers [onSpinComplete] when the animation finishes.
AnimationController createSpinController(TickerProvider vsync, VoidCallback onSpinComplete, Duration? animateDuration) {
  AnimationController controller = AnimationController(
    vsync: vsync,
    duration: animateDuration ?? const Duration(seconds: 5),
  );

  controller.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      onSpinComplete(); // Callback when spin finishes
    }
  });

  return controller;
}
