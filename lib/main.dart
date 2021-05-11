import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_flutter_app/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setOrientation();
  runApp(MyApp());
}

Future<void> _setOrientation() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Segoe',
      ),
      home: MainPage(),
    );
  }
}
