import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/CommonWidgets/appBar.dart';
import 'package:flutter_e_ticket/CommonWidgets/appDrawer.dart';

class MovieViewPublic extends StatefulWidget {
  @override
  _MovieViewPublicState createState() => _MovieViewPublicState();
}

class _MovieViewPublicState extends State<MovieViewPublic> {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection("Movie");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      extendBodyBehindAppBar: true,
      drawer: drawer(context: context),
      backgroundColor: Colors.deepPurpleAccent,
      body: StreamBuilder(
        stream: firestore.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("View Movie  Error");
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return Text(ds.data()["MovieTitle"]);
              },
            );
          }
          return CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
