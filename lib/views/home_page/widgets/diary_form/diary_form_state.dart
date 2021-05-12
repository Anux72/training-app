import 'package:flutter/material.dart';

@immutable
class DiaryFormState {
  final double buttonHeight;
  final double descriptionHeight;
  final bool descriptionHasFocus;
  final double margin;
  final String descriptionText;
  final String titleText;
  final bool titleHasFocus;
  final String error;

  DiaryFormState({
    @required this.buttonHeight,
    @required this.descriptionHeight,
    @required this.descriptionHasFocus,
    @required this.margin,
    @required this.descriptionText,
    @required this.titleText,
    @required this.titleHasFocus,
    @required this.error,
  });

  static DiaryFormState get initialState => DiaryFormState(
        buttonHeight: 0,
        descriptionHeight: 0,
        descriptionHasFocus: false,
        margin: 200,
        descriptionText: "",
        titleText: "",
        titleHasFocus: false,
        error: '',
      );

  DiaryFormState clone({
    double buttonHeight,
    double descriptionHeight,
    bool descriptionHasFocus,
    double margin,
    String descriptionText,
    String titleText,
    bool titleHasFocus,
    String error,
  }) {
    return DiaryFormState(
      buttonHeight: buttonHeight ?? this.buttonHeight,
      descriptionHeight: descriptionHeight ?? this.descriptionHeight,
      descriptionHasFocus: descriptionHasFocus ?? this.descriptionHasFocus,
      margin: margin ?? this.margin,
      descriptionText: descriptionText ?? this.descriptionText,
      titleText: titleText ?? this.titleText,
      titleHasFocus: titleHasFocus ?? this.titleHasFocus,
      error: error ?? this.error,
    );
  }
}
