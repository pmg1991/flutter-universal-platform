/// Provides access to the type of the current platform.
library universal_platform;

import 'src/universal_platform_locator.dart'
    if (dart.library.io) 'src/platform_io.dart';

/// A class that provides access to the type of the current platform.
///
/// Unlike Dart's [Platform] class, this implementation works on both native
/// platforms, such as mobile and desktop, as well as web.
///
/// Use [value] to get the current platform, or use the `is...` properties to
/// check the current platform against a particular type, such as [isWeb],
/// [isMacOS] or [isAndroid].
abstract class UniversalPlatform {
  const UniversalPlatform._();

  /// {@macro universal_platform.overrideTestValue}
  static UniversalPlatformType? _overrideTestValue;

  /// {@template universal_platform.overrideTestValue}
  /// Provides an override for the current platform for use in testing.
  ///
  /// Can be cleared using [clearOverrideTestValue].
  ///
  /// If set to a non-null value, all platform checks will use this value. This
  /// is useful for simulating a platform in tests that is not the same as the
  /// actual platform the test is running on.
  ///
  /// This is intended for use in testing only. Do not set this in production
  /// code.
  ///
  /// ```dart
  /// test('isMobile function works properly', () {
  ///   // Set the override value to simulate a platform.
  ///   UniversalPlatform.overrideTestValue = UniversalPlatformType.MacOS;
  ///   // Don't forget to reset the override value when done.
  ///   addTearDown(UniversalPlatform.clearOverrideTestValue);
  ///
  ///   expect(isMobile(), isFalse); // ✅
  ///
  ///   UniversalPlatform.overrideTestValue = UniversalPlatformType.IOS;
  ///
  ///   expect(isMobile(), isTrue); // ✅
  /// });
  /// ```
  ///
  /// See also:
  /// * [clearOverrideTestValue], which clears this value and returns it to
  ///   the actual platform.
  /// {@endtemplate}
  static set overrideTestValue(UniversalPlatformType value) {
    _overrideTestValue = value;
  }

  /// Clears the testing override for the current platform.
  ///
  /// See [overrideTestValue] for more details.
  static void clearOverrideTestValue() {
    _overrideTestValue = null;
  }

  /// The current platform this program is running on.
  ///
  /// See [UniversalPlatformType] for more details.
  static UniversalPlatformType get value =>
      _overrideTestValue ?? currentUniversalPlatform;

  /// Indicates whether this program is running in a web browser.
  static bool get isWeb => value == UniversalPlatformType.Web;

  /// Indicates whether this program is running on a Microsoft Windows machine.
  static bool get isMacOS => value == UniversalPlatformType.MacOS;

  /// Indicates whether this program is running on a Linux machine.
  static bool get isWindows => value == UniversalPlatformType.Windows;

  /// Indicates whether this program is running on an Apple macOS machine.
  static bool get isLinux => value == UniversalPlatformType.Linux;

  /// Indicates whether this program is running on a Google Android device.
  static bool get isAndroid => value == UniversalPlatformType.Android;

  /// Indicates whether this program is running on a Google Fuchsia device.
  static bool get isIOS => value == UniversalPlatformType.IOS;

  /// Indicates whether this program is running on an Apple iOS device.
  static bool get isFuchsia => value == UniversalPlatformType.Fuchsia;

  /// Indicates whether this program is running on a desktop machine.
  static bool get isDesktop => isMacOS || isWindows || isLinux;

  /// Indicates whether this program is running on a mobile device.
  static bool get isMobile => isAndroid || isIOS || isFuchsia;
}

/// A type of platform.
///
/// This is used by [UniversalPlatform] to indicate the platform that the
/// current program is running on.
enum UniversalPlatformType {
  /// The current platform is a web browser.
  Web,

  /// The current platform is a Microsoft Windows machine.
  Windows,

  /// The current platform is a Linux machine.
  Linux,

  /// The current platform is an Apple macOS machine.
  MacOS,

  /// The current platform is a Google Android device.
  Android,

  /// The current platform is a Google Fuchsia device.
  Fuchsia,

  /// The current platform is an Apple iOS device.
  IOS,
}
