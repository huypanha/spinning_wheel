## 0.0.1

* initial draft of the fortune wheel.

## 0.0.2

* SetState issue of view fixed.

## 0.0.3

## 0.0.4
* Added `background` parameter to `SpinnerWheel` for custom background widgets.
* Added `shouldDrawBackground` to toggle background visibility.
* Added weighted probability support (`probability` field in `WheelSegment`).
* Added performance optimizations (`RepaintBoundary`) for smoother animations.
* Made `color` optional in `WheelSegment` (defaults to random color).

## 0.0.5
* **Dual Image Support**: Pass both local asset paths and Network URLs (e.g., `https://...`) to `WheelSegment`.
* Improved `image_loader` logic to automatically detect and fetch network images.
