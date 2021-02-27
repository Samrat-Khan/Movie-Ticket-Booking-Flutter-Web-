import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:uuid/uuid.dart';

class UploadMovieToFirebase {
  var uuid = Uuid();

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
