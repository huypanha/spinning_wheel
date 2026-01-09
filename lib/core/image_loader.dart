import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';
import '../models/wheel_segment.dart';

/// Loads an image from either a local asset path or a network URL.
Future<ui.Image> loadImage(String path) async {
  ImageProvider provider;
  if (path.startsWith('http')) {
    provider = NetworkImage(path);
  } else {
    provider = AssetImage(path);
  }

  final Completer<ui.Image> completer = Completer<ui.Image>();
  final ImageStream stream = provider.resolve(ImageConfiguration.empty);

  ImageStreamListener? listener;
  listener = ImageStreamListener(
    (ImageInfo frame, bool synchronousCall) {
      completer.complete(frame.image);
      if (listener != null) stream.removeListener(listener);
    },
    onError: (Object exception, StackTrace? stackTrace) {
      completer.completeError(exception, stackTrace);
      if (listener != null) stream.removeListener(listener);
    },
  );

  stream.addListener(listener);
  return completer.future;
}

Future<List<WheelSegment>> loadSegmentImages(
    List<WheelSegment> segments) async {
  List<WheelSegment> processedSegments = [];

  for (var segment in segments) {
    if ((segment.path ?? '').isNotEmpty) {
      try {
        final ui.Image loadedImage = await loadImage(segment.path!);
        processedSegments.add(WheelSegment(
          segment.label,
          segment.value,
          color: segment.color,
          path: segment.path,
          image: loadedImage,
          probability: segment.probability,
        ));
      } catch (e) {
        debugPrint('Error loading image for segment ${segment.label}: $e');
        processedSegments.add(segment);
      }
    } else {
      processedSegments.add(segment);
    }
  }

  return processedSegments;
}
