import 'package:share_content_plugin/share_content_plugin.dart';

class PluginTest {
  static start() async {
    Future.delayed(Duration(seconds: 2), () {
      ShareContentPlugin.startShare('https://zhangmiao.cc/');
    });
  }
}
