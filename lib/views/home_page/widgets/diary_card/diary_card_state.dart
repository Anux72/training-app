import 'package:flutter/material.dart';

@immutable
class DiaryCardState {
  final String error;
  final bool clicked;

  DiaryCardState({
    @required this.error,
    @required this.clicked,
  });

  static DiaryCardState get initialState => DiaryCardState(
        error: '',
        clicked: false,
      );

  DiaryCardState clone({
    String error,
    bool clicked,
  }) {
    return DiaryCardState(
      error: error ?? this.error,
      clicked: clicked ?? this.clicked,
    );
  }
}
