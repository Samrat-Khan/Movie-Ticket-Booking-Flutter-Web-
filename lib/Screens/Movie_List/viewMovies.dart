import 'package:flutter/material.dart';
import 'package:flutter_e_ticket/CommonWidgets/appBar.dart';
import 'package:flutter_e_ticket/CommonWidgets/appDrawer.dart';
import 'package:flutter_e_ticket/Services/Models/movieModel.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../main.dart';

class MovieViewPublic extends StatefulWidget {
  @override
  _MovieViewPublicState createState() => _MovieViewPublicState();
}

class _MovieViewPublicState extends State<MovieViewPublic> {
  Box<MovieModel> hiveMovieData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hiveMovieData = Hive.box<MovieModel>(movieModelName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      extendBodyBehindAppBar: true,
      drawer: drawer(context: context),
      backgroundColor: Colors.deepPurpleAccent,
      body: ValueListenableBuilder(
          valueListenable: hiveMovieData.listenable(),
          builder: (context, Box<MovieModel> movies, _) {
            List<int> keys = movies.keys.cast<int>().toList();

            return ListView.builder(
                itemCount: keys.length,
                itemBuilder: (_, index) {
                  final int key = keys[index];
                  final MovieModel movie = movies.get(key);
                  return Text(movie.movieTitle);
                });
          }),
    );
  }
}
