import 'dart:async';
import 'package:flutter/services.dart';

class ShareContentPlugin {
  static const MethodChannel _channel = const MethodChannel('share_content_plugin');

  static Future startShare(String urlStr) async {
    await _channel.invokeMethod('shareInfo', urlStr);
  }
}
