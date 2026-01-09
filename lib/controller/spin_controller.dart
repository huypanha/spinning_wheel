import 'package:flutter/foundation.dart';
import '../spinner_wheel.dart';

/// A controller used to programmatically trigger the spinning wheel.
class SpinnerController {
  SpinnerWheelState? _state;

  /// Attaches the controller to a [SpinnerWheelState].
  /// This is called internally by the [SpinnerWheel].
  void attachState(SpinnerWheelState state) {
    _state = state;
  }

  /// Triggers the wheel to start spinning based on the configured segments and logic.
  Future<void> startSpin() async {
    if (_state != null) {
      await _state!.startSpin();
    } else {
      if (kDebugMode) {
        print("Error: SpinnerWheelState is not attached to the controller!");
      }
    }
  }
}
