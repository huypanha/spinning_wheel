# 🎡 Spinning Wheel - Flutter Package

[![pub package](https://img.shields.io/pub/v/spinning_wheel.svg)](https://pub.dev/packages/spinning_wheel) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT) [![GitHub stars](https://img.shields.io/github/stars/nitesh695/spinning_wheel?style=social)](https://github.com/nitesh695/spinning_wheel)

A fully customizable spinning wheel for Flutter applications! Easily create fortune wheels, prize spinners, or game-based random selectors with smooth animations and custom segments.

## 🌟 Features

- ✅ **Fully customizable spinning wheel** 🎨
- ✅ **Supports text labels, colors, and images** 🖼️
- ✅ **Smooth animation with realistic spin physics** 🎯
- ✅ **Callback for detecting spin completion** 🔥

## 📸 Preview

<div align="center">
  <img src="https://raw.githubusercontent.com/nitesh695/spinning_wheel/main/example/assets/images/img.png" alt="Spinning Wheel Demo" style="width: 100%; max-width: 500px;">
</div>

## 📦 Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  spinning_wheel: latest_version
```

## 🔧 Usage

### 1️⃣ Import the Package

```dart
import 'package:spinning_wheel/spinning_wheel.dart';
```

### 2️⃣ Create a `SpinnerController`

```dart
final SpinnerController controller = SpinnerController();
```

### 3️⃣ Define `Wheel Segments`

```dart
List<WheelSegment> segments = [
  WheelSegment("Prize 1", Colors.red, 10),
  WheelSegment("Prize 2", Colors.blue, 20),
  WheelSegment("Prize 3", Colors.green, 30),
  WheelSegment("Prize 4", Colors.orange, 40),
];
```

### 4️⃣ Add the `SpinnerWheel` Widget

```dart
SpinnerWheel(
  controller: controller,
  segments: segments,
  wheelColor: Colors.white,
  onComplete: (result, index) {
    print("You won: ${result.label}...$index");
  },
),
```

### 5️⃣ Start Spinning!

```dart
controller.startSpin();
```

## 📜 API Reference

| Property            | Type                     | Description                                     | Default    |
|---------------------|--------------------------|-------------------------------------------------|------------|
| `controller`        | `SpinnerController`      | Controls the spin animation                     | Required   |
| `segments`          | `List<WheelSegment>`     | List of wheel segments (labels, colors, images) | Required   |
| `wheelColor`        | `Color?`                 | Background color of the wheel                   | Optional   |
| `onComplete`        | `Function(WheelSegment)` | Callback triggered when spin completes          | Required   |
| `centerChild`       | `Widget?`                | Custom widget for the wheel center              | Optional   |
| `indicator`         | `Widget?`                | Custom widget for the indicator                 | Optional   |
| `indicatorColor`    | `Color?`                 | Background color of the indicator               | Optional   |
| `imageHeight`       | `double?`                | Height of the image of segment                  | Optional   |
| `imageWidth`        | `double?`                | Width of the image of segment                   | Optional   |
| `labelStyle`        | `TextStyle?`             | Text Style for the label of segments            | Optional   |

## 📄 License

This package is licensed under the **MIT License**.

## 🙏 Support

If you like this package, ⭐ **Star it on [GitHub](https://github.com/nitesh695/spinning_wheel)**!  
For issues or feature requests, open an issue on [GitHub](https://github.com/nitesh695/spinning_wheel/issues).