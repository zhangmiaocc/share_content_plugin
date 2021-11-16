import 'package:flutter/material.dart';
import 'plugin_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PluginTest.start();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar(title: const Text('插件示例'))));
  }
}
