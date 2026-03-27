# 🎡 Spinning Wheel - Flutter Package

[![pub package](https://img.shields.io/pub/v/spinning_wheel.svg)](https://pub.dev/packages/spinning_wheel) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT) [![GitHub stars](https://img.shields.io/github/stars/nitesh695/spinning_wheel?style=social)](https://github.com/nitesh695/spinning_wheel)


A fully customizable spinning wheel for Flutter applications! Easily create fortune wheels, prize spinners, or game-based random selectors with smooth animations and custom segments.

## 🌟 Features

- ✅ **Fully customizable spinning wheel** 🎨
- ✅ **Dual Image Support** (Local Assets & Network URLs) 🖼️🌐
- ✅ **Advanced Label Styling** (Control rotation, style, and alignment) ✍️
- ✅ **Smart Text Clipping** (Auto-ellipsis or clipping for long text) 🛡️
- ✅ **Supports text labels, colors, and images** 🖼️
- ✅ **Smooth animation with realistic spin physics** 🎯
- ✅ **Weighted Probability Support** (Control win frequencies) ⚖️
- ✅ **Flexible Padding** (Independent control for rim, center, and side spacing) 📏

## 📸 Preview

<div align="center">
  <img src="https://raw.githubusercontent.com/nitesh695/spinning_wheel/main/example/assets/images/img.png" alt="Spinning Wheel Demo" width="300" style="border-radius: 30px; border: 8px solid #222; box-shadow: 0 10px 30px rgba(0,0,0,0.3);">
</div>

## 📦 Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  spinning_wheel: ^0.0.7
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
  WheelSegment("Jackpot!", 1000, color: Colors.orange, probability: 0.05), 
  WheelSegment("Prize 2", 20, color: Colors.blue, probability: 0.3),
  // Supports Network Images! 🌐
  WheelSegment("Gift", 100, path: "https://example.com/gift_icon.png"), 
  WheelSegment("Empty", 0, color: Colors.grey, probability: 0.2), 
];
```

### 4️⃣ Add the `SpinnerWheel` Widget

```dart
SpinnerWheel(
  controller: controller,
  segments: segments,
  // NEW: Precise Padding 📏
  slicePadding: const EdgeInsets.only(top: 20, bottom: 10, left: 5, right: 5),
  // NEW: Advanced Label Styling 🎨
  labelStyle: const WheelLabelStyle(
    labelStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    overflow: TextOverflow.ellipsis, // Auto-handle long text
    maxLines: 1,
    angle: 0.0,
  ),
  onComplete: (result, index) {
    print("You won: ${result.label}!");
  },
),
```

### 5️⃣ Start Spinning!

```dart
controller.startSpin();
```

## 📜 API Reference

### SpinnerWheel

| Property               | Type                          | Description                                     | Default     |
|------------------------|-------------------------------|-------------------------------------------------|-------------|
| `controller`           | `SpinnerController`           | Controls the spin animation                     | Required    |
| `segments`             | `List<WheelSegment>`          | List of wheel segments (labels, colors, images) | Required    |
| `onComplete`           | `Function(WheelSegment, int)` | Callback triggered when spin completes          | Required    |
| `labelStyle`           | `WheelLabelStyle?`            | Advanced styling for segment labels             | Optional    |
| `slicePadding`         | `EdgeInsets`                  | Padding inside slices (rim, center, and sides)  | `zero`      |
| `wheelColor`           | `Color?`                      | Background color tint of the wheel              | Optional    |
| `centerChild`          | `Widget?`                     | Custom widget for the wheel center              | Optional    |
| `indicator`            | `Widget?`                     | Custom widget for the indicator                 | Optional    |
| `background`           | `Widget?`                     | Custom widget for the wheel background layer    | Optional    |
| `shouldDrawBackground` | `bool`                        | Toggle background visibility                    | `true`      |
| `animateDuration`      | `Duration`                    | Duration of spinning animation                  | `5 seconds` |

### WheelLabelStyle

| Property     | Type          | Description                                           | Default |
|--------------|---------------|-------------------------------------------------------|---------|
| `labelStyle` | `TextStyle?`  | The theme/style of the text                           | Default |
| `angle`      | `double`      | Additional rotation for the text (in radians)         | `0.0`   |
| `overflow`   | `TextOverflow`| Handing for long text (clip, ellipsis, etc.)          | `clip`  |
| `maxLines`   | `int?`        | Maximum number of lines for the label                 | `1`     |

## 📄 License

This package is licensed under the **MIT License**.

## 🙏 Support

If you like this package, ⭐ **Star it on [GitHub](https://github.com/nitesh695/spinning_wheel)**!  
For issues or feature requests, open an issue on [GitHub](https://github.com/nitesh695/spinning_wheel/issues).