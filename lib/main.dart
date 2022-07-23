import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasbeeh/screens/home_screen.dart';
import 'package:tasbeeh/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
