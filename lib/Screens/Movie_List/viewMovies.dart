import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/CommonWidgets/appBar.dart';
import 'package:flutter_e_ticket/CommonWidgets/appDrawer.dart';

class MovieViewPublic extends StatefulWidget {
  @override
  _MovieViewPublicState createState() => _MovieViewPublicState();
}

class _MovieViewPublicState extends State<MovieViewPublic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      extendBodyBehindAppBar: true,
      drawer: drawer(context: context),
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Text("All Movies"),
      ),
    );
  }
}
