import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/Screens/Movie_Add_ByAdmin/Add_Movie.dart';

class AdminProfile extends StatefulWidget {
  @override
  _AdminProfileState createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: AddMovie(),
    );
  }
}
