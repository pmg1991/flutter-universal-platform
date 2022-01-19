import 'dart:io';

import 'package:test/test.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  group('UniversalPlatform', () {
    group('value', () {
      test('returns current platform value by default', () {
        final value = UniversalPlatform.value;

        if (Platform.isAndroid) {
          expect(value, equals(UniversalPlatformType.Android));
        } else if (Platform.isIOS) {
          expect(value, equals(UniversalPlatformType.IOS));
        } else if (Platform.isMacOS) {
          expect(value, equals(UniversalPlatformType.MacOS));
        } else if (Platform.isWindows) {
          expect(value, equals(UniversalPlatformType.Windows));
        } else if (Platform.isLinux) {
          expect(value, equals(UniversalPlatformType.Linux));
        } else if (Platform.isFuchsia) {
          expect(value, equals(UniversalPlatformType.Fuchsia));
        } else {
          fail(
            'Test is not running on a supported platform: '
            '${Platform.operatingSystem}',
          );
        }
      });

      test('returns test override platform type when set', () {
        const override = UniversalPlatformType.Android;

        UniversalPlatform.overrideTestValue = override;
        addTearDown(UniversalPlatform.clearOverrideTestValue);

        expect(UniversalPlatform.value, equals(override));
      });
    });
  });
}
