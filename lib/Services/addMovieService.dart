import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UploadMovieToFirebase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // String movieTitle, aboutMovie, cast_1, cast_2, cast_3, cast_4, cast_5;
  // int ticketPrice;
  // File moviePoster, cast1Photo, cast2Photo, cast3Photo, cast4Photo, cast5Photo;
  // TimeOfDay morningShow, noonShow, eveningShow, nightShow;
  // DateTime startDate, endDate;
  var uuid = Uuid();
  Future uploadMovieDetail({
    @required Uint8List moviePoster,
    @required Uint8List cast1Photo,
    @required Uint8List cast2Photo,
    @required Uint8List cast3Photo,
    @required Uint8List cast4Photo,
    @required Uint8List cast5Photo,
    @required TimeOfDay morningShow,
    @required TimeOfDay noonShow,
    @required TimeOfDay eveningShow,
    @required TimeOfDay nightShow,
    @required String movieTitle,
    @required String aboutMovie,
    @required String cast_1,
    @required String cast_2,
    @required String cast_3,
    @required String cast_4,
    @required String cast_5,
    @required int ticketPrice,
    @required DateTime startDate,
    @required DateTime endDate,
    @required BuildContext context,
  }) async {
    var uuid_1 = uuid.v1();
    int _dateTime = DateTime.now().microsecondsSinceEpoch;
    try {
      await firestore.collection("Movie").doc(uuid_1).set(
        {
          "TimeStamp": _dateTime,
          "MovieTitle": movieTitle,
          "MoviePoster": await uploadPosterToFirebaseStorage(
              movieName: movieTitle, posterImage: moviePoster),
          "AboutMovie": aboutMovie,
          "TicketPrice": ticketPrice,
          "Cast": {
            "Cast1": {
              "Name": cast_1,
              "Photo": await uploadCastPhotoToFirebaseStorage(
                  castName: cast_1,
                  movieName: movieTitle,
                  castPhoto: cast1Photo),
            },
            "Cast2": {
              "Name": cast_2,
              "Photo": await uploadCastPhotoToFirebaseStorage(
                  castName: cast_2,
                  movieName: movieTitle,
                  castPhoto: cast2Photo),
            },
            "Cast3": {
              "Name": cast_3,
              "Photo": await uploadCastPhotoToFirebaseStorage(
                  castName: cast_3,
                  movieName: movieTitle,
                  castPhoto: cast3Photo),
            },
            "Cast4": {
              "Name": cast_4,
              "Photo": await uploadCastPhotoToFirebaseStorage(
                  castName: cast_4,
                  movieName: movieTitle,
                  castPhoto: cast4Photo),
            },
            "Cast5": {
              "Name": cast_5,
              "Photo": await uploadCastPhotoToFirebaseStorage(
                  castName: cast_5,
                  movieName: movieTitle,
                  castPhoto: cast5Photo),
            },
          },
          "ShowTime": {
            "MorningShow": morningShow.format(context),
            "NoonShow": noonShow.format(context),
            "EveningShow": eveningShow.format(context),
            "NightShow": nightShow.format(context),
          },
          "MovieDate": {
            "StartDate": startDate,
            "EndDate": endDate,
          },
        },
      );
    } catch (e) {
      print("Something happening $e");
    }
  }

  Future<String> uploadPosterToFirebaseStorage(
      {String movieName, Uint8List posterImage}) async {
    storage.Reference ref = storage.FirebaseStorage.instance
        .ref("Movie")
        .child("MoviePoster/$movieName.png");
    await ref.putData(posterImage);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<String> uploadCastPhotoToFirebaseStorage(
      {String castName, Uint8List castPhoto, String movieName}) async {
    storage.Reference ref = storage.FirebaseStorage.instance
        .ref("MovieCast")
        .child("CastPhoto/$movieName/$castName.png");

    await ref.putData(castPhoto);
    String url = await ref.getDownloadURL();
    return url;
  }
}
