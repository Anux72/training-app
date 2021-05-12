import 'package:flutter/material.dart';

@immutable
class DiaryCardState {
  final String buttonText;
  final int descriptionLines;
  final String error;

  DiaryCardState({
    @required this.buttonText,
    @required this.descriptionLines,
    @required this.error,
  });

  static DiaryCardState get initialState => DiaryCardState(
        buttonText: "more",
        descriptionLines: 3,
        error: '',
      );

  DiaryCardState clone({
    String buttonText,
    int descriptionLines,
    String error,
  }) {
    return DiaryCardState(
      buttonText: buttonText ?? this.buttonText,
      descriptionLines: descriptionLines ?? this.descriptionLines,
      error: error ?? this.error,
    );
  }
}
