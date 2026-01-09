# 🎡 Spinning Wheel - Flutter Package

[![pub package](https://img.shields.io/pub/v/spinning_wheel.svg)](https://pub.dev/packages/spinning_wheel) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT) [![GitHub stars](https://img.shields.io/github/stars/nitesh695/spinning_wheel?style=social)](https://github.com/nitesh695/spinning_wheel)

A fully customizable spinning wheel for Flutter applications! Easily create fortune wheels, prize spinners, or game-based random selectors with smooth animations and custom segments.

## 🌟 Features

- ✅ **Fully customizable spinning wheel** 🎨
- ✅ **Dual Image Support** (Local Assets & Network URLs) 🖼️🌐
- ✅ **Supports text labels, colors, and images** 🖼️
- ✅ **Smooth animation with realistic spin physics** 🎯
- ✅ **Weighted Probability Support** (Control win frequencies) ⚖️
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
  WheelSegment("Prize 1", 10, color: Colors.red, probability: 0.5), // 50% chance
  WheelSegment("Prize 2", 20, color: Colors.blue, probability: 0.3), // 30% chance
  // Supports Network Images! 🌐
  WheelSegment("Gift", 100, path: "https://example.com/gift_icon.png"), 
  WheelSegment("Prize 3", 30, color: Colors.green, probability: 0.2), // 20% chance
];
```

### 4️⃣ Add the `SpinnerWheel` Widget

```dart
SpinnerWheel(
  controller: controller,
  segments: segments,
  wheelColor: Colors.white,
  background: Image.asset('assets/wheel.png'), // Custom background widget
  shouldDrawBackground: true, // Toggle background visibility
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
| `wheelColor`        | `Color?`                 | Background color of the wheel tint              | Optional   |
| `onComplete`        | `Function(WheelSegment)` | Callback triggered when spin completes          | Required   |
| `centerChild`       | `Widget?`                | Custom widget for the wheel center              | Optional   |
| `indicator`         | `Widget?`                | Custom widget for the indicator                 | Optional   |
| `indicatorColor`    | `Color?`                 | Background color of the indicator               | Optional   |
| `imageHeight`       | `double?`                | Height of the image of segment                  | Optional   |
| `imageWidth`        | `double?`                | Width of the image of segment                   | Optional   |
| `labelStyle`        | `TextStyle?`             | Text Style for the label of segments            | Optional   |
| `background`        | `Widget?`                | Custom widget for the wheel background layer    | Optional   |
| `shouldDrawBackground`| `bool`                 | Toggle to hide/show the background layer        | `true`     |

## 📄 License

This package is licensed under the **MIT License**.

## 🙏 Support

If you like this package, ⭐ **Star it on [GitHub](https://github.com/nitesh695/spinning_wheel)**!  
For issues or feature requests, open an issue on [GitHub](https://github.com/nitesh695/spinning_wheel/issues).