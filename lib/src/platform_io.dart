import 'dart:io';
import '../universal_platform.dart';

/// Override for the `currentUniversalPlatform` that returns a
/// [UniversalPlatformType] depending on the current `dart:io` [Platform].
UniversalPlatformType get currentUniversalPlatform {
  if (Platform.isWindows) return UniversalPlatformType.Windows;
  if (Platform.isFuchsia) return UniversalPlatformType.Fuchsia;
  if (Platform.isMacOS) return UniversalPlatformType.MacOS;
  if (Platform.isLinux) return UniversalPlatformType.Linux;
  if (Platform.isIOS) return UniversalPlatformType.IOS;
  return UniversalPlatformType.Android;
}
