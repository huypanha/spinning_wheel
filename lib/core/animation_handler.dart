import 'package:flutter/material.dart';

AnimationController createSpinController(
    TickerProvider vsync, VoidCallback onSpinComplete) {
  AnimationController controller = AnimationController(
    vsync: vsync,
    duration: const Duration(seconds: 5),
  );

  controller.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      onSpinComplete(); // Callback when spin finishes
    }
  });

  return controller;
}
