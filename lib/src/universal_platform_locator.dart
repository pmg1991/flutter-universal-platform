import '../universal_platform.dart';

/// Override for the `currentUniversalPlatform` that always returns
/// [UniversalPlatformType.Web].
UniversalPlatformType get currentUniversalPlatform => UniversalPlatformType.Web;
