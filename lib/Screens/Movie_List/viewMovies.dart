import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/CommonWidgets/appBar.dart';
import 'package:flutter_e_ticket/CommonWidgets/appDrawer.dart';

class MovieViewPublic extends StatefulWidget {
  @override
  _MovieViewPublicState createState() => _MovieViewPublicState();
}

class _MovieViewPublicState extends State<MovieViewPublic> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      extendBodyBehindAppBar: true,
      drawer: drawer(context: context),
      backgroundColor: Colors.deepPurpleAccent,
      body: FutureBuilder(
        future: firestore.collection("Movie").get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> ds = snapshot.data.data();
            return Text("Data is ${ds["AboutMovie"]} ");
          }
          return CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
