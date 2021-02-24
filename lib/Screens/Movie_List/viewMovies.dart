import 'dart:io';

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
    File image;
    return Scaffold(
      appBar: appBar(),
      extendBodyBehindAppBar: true,
      drawer: drawer(context: context),
      backgroundColor: Colors.deepPurpleAccent,
      body: Wrap(
        runAlignment: WrapAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 50, right: 20),
            child: Card(
              child: Container(
                constraints: BoxConstraints.tightFor(height: 180, width: 150),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image != null
                        ? FileImage(image)
                        : AssetImage("assets/images/face.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
