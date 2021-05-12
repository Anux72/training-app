import 'package:flutter/material.dart';

@immutable
class DiaryFormState {
  final bool descriptionHasFocus;
  final String descriptionText;
  final String titleText;
  final bool titleHasFocus;
  final String error;

  DiaryFormState({
    @required this.descriptionHasFocus,
    @required this.descriptionText,
    @required this.titleText,
    @required this.titleHasFocus,
    @required this.error,
  });

  static DiaryFormState get initialState => DiaryFormState(
        descriptionHasFocus: false,
        descriptionText: "",
        titleText: "",
        titleHasFocus: false,
        error: '',
      );

  DiaryFormState clone({
    bool descriptionHasFocus,
    String descriptionText,
    String titleText,
    bool titleHasFocus,
    String error,
  }) {
    return DiaryFormState(
      descriptionHasFocus: descriptionHasFocus ?? this.descriptionHasFocus,
      descriptionText: descriptionText ?? this.descriptionText,
      titleText: titleText ?? this.titleText,
      titleHasFocus: titleHasFocus ?? this.titleHasFocus,
      error: error ?? this.error,
    );
  }
}
