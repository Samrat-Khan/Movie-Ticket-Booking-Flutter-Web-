import 'dart:io';

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
    File moviePoster,
    File cast1Photo,
    File cast2Photo,
    File cast3Photo,
    File cast4Photo,
    File cast5Photo,
    TimeOfDay morningShow,
    TimeOfDay noonShow,
    TimeOfDay eveningShow,
    TimeOfDay nightShow,
    String movieTitle,
    String aboutMovie,
    String cast_1,
    String cast_2,
    String cast_3,
    String cast_4,
    String cast_5,
    int ticketPrice,
    DateTime startDate,
    DateTime endDate,
  }) async {
    var uuid_1 = uuid.v1();
    int _dateTime = DateTime.now().microsecondsSinceEpoch;
    await firestore.collection("Movie").doc(uuid_1).set(
      {
        "TimeStamp": _dateTime,
        "MovieTitle": movieTitle,
        "MoviePoster": await uploadPhotoToFirebaseStorage(
            movieName: movieTitle, posterImage: moviePoster),
        "AboutMovie": aboutMovie,
        "TicketPrice": ticketPrice,
        "Cast": {
          "Cast1": {
            "Name": cast_1,
            "Photo": await uploadCastPhotoToFirebaseStorage(
                castName: cast_1, movieName: movieTitle, castPhoto: cast1Photo),
          },
          "Cast2": {
            "Name": cast_2,
            "Photo": await uploadCastPhotoToFirebaseStorage(
                castName: cast_2, movieName: movieTitle, castPhoto: cast2Photo),
          },
          "Cast3": {
            "Name": cast_3,
            "Photo": await uploadCastPhotoToFirebaseStorage(
                castName: cast_3, movieName: movieTitle, castPhoto: cast3Photo),
          },
          "Cast4": {
            "Name": cast_4,
            "Photo": await uploadCastPhotoToFirebaseStorage(
                castName: cast_4, movieName: movieTitle, castPhoto: cast4Photo),
          },
          "Cast5": {
            "Name": cast_5,
            "Photo": await uploadCastPhotoToFirebaseStorage(
                castName: cast_5, movieName: movieTitle, castPhoto: cast5Photo),
          },
        },
        "ShowTime": {
          "MorningShow": morningShow,
          "NoonShow": noonShow,
          "EveningShow": eveningShow,
          "NightShow": nightShow,
        },
        "MovieDate": {
          "StartDate": startDate,
          "EndDate": endDate,
        },
      },
    );
  }

  Future<String> uploadPhotoToFirebaseStorage(
      {String movieName, File posterImage}) async {
    storage.Reference ref = storage.FirebaseStorage.instance
        .ref("Movie")
        .child("MoviePoster/$movieName");
    await ref.putFile(posterImage);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<String> uploadCastPhotoToFirebaseStorage(
      {String castName, File castPhoto, String movieName}) async {
    storage.Reference ref = storage.FirebaseStorage.instance
        .ref("MovieCast")
        .child("CastPhoto/$movieName/$castName");
    await ref.putFile(castPhoto);
    String url = await ref.getDownloadURL();
    return url;
  }
}
