import 'dart:math';
import '../models/wheel_segment.dart';

/// Holds the calculation results for a wheel spin animation.
class SpinResult {
  /// The starting rotation angle in radians.
  final double start;

  /// The final calculated rotation angle in radians.
  final double end;

  /// Creates a [SpinResult].
  SpinResult(this.start, this.end);
}

/// Calculates the target [end] rotation for a spin based on weighted probabilities.
///
/// [startRotation] is the current angle of the wheel.
/// [segments] is the list of wheel slices to calculate against.
SpinResult spinWheel(double startRotation, List<WheelSegment> segments) {
  // Use Random.secure() for cryptographically secure randomness (better fairness)
  final Random random = Random.secure();
  final int spinCount = 5 + random.nextInt(5);

  // Weighted random selection
  int selectedIndex = -1;
  double totalProbability =
      segments.fold(0.0, (sum, segment) => sum + (segment.probability ?? 0.0));

  // If no probabilities provided or total is 0, fall back to uniform distribution
  if (totalProbability == 0.0) {
    selectedIndex = random.nextInt(segments.length);
  } else {
    double randomValue = random.nextDouble() * totalProbability;
    double currentSum = 0.0;

    for (int i = 0; i < segments.length; i++) {
      double p = segments[i].probability ?? 0.0;
      if (p > 0) {
        currentSum += p;
        if (randomValue <= currentSum) {
          selectedIndex = i;
          break;
        }
      }
    }

    // Robust Fallback:
    // If floating point precision errors cause the loop to finish without selecting,
    // the value technically belongs to the last segment with probability > 0.
    if (selectedIndex == -1) {
      for (int i = segments.length - 1; i >= 0; i--) {
        if ((segments[i].probability ?? 0.0) > 0) {
          selectedIndex = i;
          break;
        }
      }
    }
  }

  // Final Safety Net: if still -1 (e.g. all probs were 0 but totalProbability > 0 somehow??), pick random.
  if (selectedIndex == -1) {
    selectedIndex = random.nextInt(segments.length);
  }

  // Calculate target angle range for the selected segment
  // The wheel painter draws segments clockwise (or counter depending on logic)
  // determineSegment logic:
  // invertedAngle = 2*pi - normalizedAngle
  // index = invertedAngle ~/ segmentAngle
  // So invertedAngle must be between index*segmentAngle and (index+1)*segmentAngle

  double segmentAngle = 2 * pi / segments.length;

  // Pick a random spot within the segment (10% to 90%) to avoid landing on lines
  double randomOffset = 0.1 + (random.nextDouble() * 0.8);
  double targetInvertedAngle = (selectedIndex + randomOffset) * segmentAngle;

  double targetNormalizedAngle = (2 * pi - targetInvertedAngle) % (2 * pi);

  double currentPhase = startRotation % (2 * pi);
  double diff = targetNormalizedAngle - currentPhase;
  if (diff < 0) diff += 2 * pi;

  double endRotation = startRotation + (spinCount * 2 * pi) + diff;

  return SpinResult(startRotation, endRotation);
}

/// Determines which segment index is at the top position based on the final [endRotation].
int determineSegment(List<WheelSegment> segments, double endRotation) {
  final double normalizedAngle = endRotation % (2 * pi);
  final double segmentAngle = 2 * pi / segments.length;
  final double invertedAngle = 2 * pi - normalizedAngle;
  final int segmentIndex = (invertedAngle ~/ segmentAngle) % segments.length;

  return segmentIndex;
}
