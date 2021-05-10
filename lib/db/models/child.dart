import 'package:fcode_bloc/fcode_bloc.dart';

class Child extends DBModel {
  static const CARDCOLOR_FIELD = "cardColor";
  static const DESCRIPTION_FIELD = "description";
  static const SUBTITLE_FIELD = "subtitle";
  static const TIME_FIELD = "timestamp";
  static const TITLE_FIELD = "title";

  int cardColor;
  String description;
  String subtitle;
  int timestamp;
  String title;

  Child({
    this.cardColor,
    this.description,
    this.subtitle,
    this.timestamp,
    this.title,
  });
}
