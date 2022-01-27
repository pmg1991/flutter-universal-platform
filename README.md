# Universal Platform - A Web-safe Platform class

[![pub package](https://img.shields.io/pub/v/universal_platform.svg)](https://pub.dev/packages/universal_platform)
[![likes](https://badges.bar/universal_platform/likes)](https://pub.dev/packages/universal_platform/score)
[![popularity](https://badges.bar/universal_platform/popularity)](https://pub.dev/packages/universal_platform/score)
[![pub points](https://badges.bar/universal_platform/pub%20points)](https://pub.dev/packages/universal_platform/score)

Currently, if you include the _dart.io.Platform_ anywhere in your code, your app will throw the following error on Web:

```
Unsupported operation: Platform._operatingSystem
```

With this plugin you can perform platform detection on all platforms, including Web, without errors.

## 🔨 Installation

```yaml
dependencies:
  universal_platform: ^0.1.3
```

### ⚙ Import

Remove any usages of _dart.io.Platform_, and replace with this:

```dart
import 'package:universal_platform/universal_platform.dart';
```

## 🕹️ Usage

This acts as a drop-in replacement for dart.io.Platform, with a different name for improved clarity.

```dart
//This will explode on Web
bool isIos = Platform.isIOS;

//This will not :)
bool isIos = UniversalPlatform.isIOS;
bool isWeb = UniversalPlatform.isWeb;
```

## 🧪 Testing

In tests, it's possible to override the current platform to test for different paths of behavior in your production code. You can do so by setting the `overrideTestValue` to your desired platform.

```dart
test('isMobile function works properly', () {
  // Set the override value to simulate a platform.
  UniversalPlatform.overrideTestValue = UniversalPlatformType.MacOS;
  // Don't forget to reset the override value when done.
  addTearDown(UniversalPlatform.clearOverrideTestValue);

  expect(isMobile(), isFalse); // ✅

  UniversalPlatform.overrideTestValue = UniversalPlatformType.IOS;

  expect(isMobile(), isTrue); // ✅
});
```

## 🐞 Bugs/Requests

If you encounter any problems feel open an issue. If you feel the library is missing a feature, please raise a ticket on Github and we'll look into it. Pull request are also welcome.

## 📃 License

MIT License
