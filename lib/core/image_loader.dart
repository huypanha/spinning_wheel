import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import '../models/wheel_segment.dart';

Future<ui.Image> loadImage(String path) async {
  final ByteData data = await rootBundle.load(path);
  final Uint8List list = data.buffer.asUint8List();
  final ui.Codec codec = await ui.instantiateImageCodec(list);
  final ui.FrameInfo frame = await codec.getNextFrame();
  return frame.image;
}

Future<List<WheelSegment>> loadSegmentImages(
    List<WheelSegment> segments) async {
  List<WheelSegment> processedSegments = [];

  for (var segment in segments) {
    if ((segment.path ?? '').isNotEmpty) {
      processedSegments.add(WheelSegment(
        segment.label,
        segment.value,
        color: segment.color,
        path: segment.path,
        image: await loadImage(segment.path!),
        probability: segment.probability,
      ));
    } else {
      processedSegments.add(segment);
    }
  }

  return processedSegments;
}
