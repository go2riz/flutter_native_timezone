import 'dart:async';
import 'dart:js_interop';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

///
/// The plugin class for the web.
///
class FlutterNativeTimezonePlugin {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'flutter_native_timezone',
      const StandardMethodCodec(),
      registrar,
    );
    final FlutterNativeTimezonePlugin instance = FlutterNativeTimezonePlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getLocalTimezone':
        return _getLocalTimeZone();
      case 'getAvailableTimezones':
        return <String>[_getLocalTimeZone()];
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: "The flutter_native_timezone plugin for web doesn't implement the method '${call.method}'",
        );
    }
  }

  String _getLocalTimeZone() {
    final JSString timezone = _jsDateTimeFormat().resolvedOptions().timeZone;
    return timezone.toDart;
  }
}

@JS('Intl.DateTimeFormat')
external _JSDateTimeFormat _jsDateTimeFormat();

extension type _JSDateTimeFormat(JSObject _) implements JSObject {
  external _JSResolvedOptions resolvedOptions();
}

extension type _JSResolvedOptions(JSObject _) implements JSObject {
  external JSString get timeZone;
}
