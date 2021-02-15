import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/Screens/Admin_Profile/Admin_Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminProfile(),
    );
  }
}
