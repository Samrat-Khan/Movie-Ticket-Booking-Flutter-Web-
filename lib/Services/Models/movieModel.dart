import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'movieModel.g.dart';

@HiveType(typeId: 0)
class MovieModel {
  @HiveField(0)
  final String movieTitle;
  @HiveField(1)
  final String movieDetail;
  @HiveField(2)
  final String moviePostLink;
  @HiveField(3)
  final String cast1Name;
  @HiveField(4)
  final String cast1PhotoLink;
  @HiveField(5)
  final String cast2Name;
  @HiveField(6)
  final String cast2PhotoLink;
  @HiveField(7)
  final String cast3Name;
  @HiveField(8)
  final String cast3PhotoLink;
  @HiveField(9)
  final String cast4Name;
  @HiveField(10)
  final String cast4PhotoLink;
  @HiveField(11)
  final String cast5Name;
  @HiveField(12)
  final String cast5PhotoLink;
  @HiveField(13)
  final int ticketPrice;
  @HiveField(14)
  final String morningShowTime;
  @HiveField(15)
  final String noonShowTime;
  @HiveField(16)
  final String eveningShowTime;
  @HiveField(17)
  final String nightShowTime;
  @HiveField(18)
  final DateTime startDate;
  @HiveField(19)
  final DateTime endDate;

  MovieModel({
    this.movieTitle,
    this.ticketPrice,
    this.cast1Name,
    this.cast1PhotoLink,
    this.cast2Name,
    this.cast2PhotoLink,
    this.cast3Name,
    this.cast3PhotoLink,
    this.cast4Name,
    this.cast4PhotoLink,
    this.cast5Name,
    this.cast5PhotoLink,
    this.movieDetail,
    this.moviePostLink,
    this.nightShowTime,
    this.eveningShowTime,
    this.noonShowTime,
    this.morningShowTime,
    this.endDate,
    this.startDate,
  });
}
