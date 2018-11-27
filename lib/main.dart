import 'package:flutter/material.dart';
import 'package:platform_aware_widgets_flutter/app/bottom_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
