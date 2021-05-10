import 'package:flutter/material.dart';

@immutable
class RootState {
  final List<String> randomNickNames;
  final Color labelColor;
  final Color buttonTextColor;
  final Color buttonBackgroundColor;
  final double margin;
  final Color borderColor;
  final String text;
  final bool hasFocus;
  final String error;

  RootState({
    @required this.randomNickNames,
    @required this.labelColor,
    @required this.buttonTextColor,
    @required this.buttonBackgroundColor,
    @required this.margin,
    @required this.borderColor,
    @required this.text,
    @required this.hasFocus,
    @required this.error,
  });

  static RootState get initialState => RootState(
        randomNickNames: ["James", "William", "Noah", "Logan", "Benjamin"],
        labelColor: Colors.red,
        buttonTextColor: Color(0x22000000),
        buttonBackgroundColor: Color(0x66bfbfbf),
        margin: 0.0,
        borderColor: Colors.red,
        text: "",
        error: '',
      );

  RootState clone({
    List<String> randomNickNames,
    Color labelColor,
    Color buttonTextColor,
    Color buttonBackgroundColor,
    double margin,
    Color borderColor,
    String text,
    String error,
  }) {
    return RootState(
      randomNickNames: randomNickNames ?? this.randomNickNames,
      labelColor: labelColor ?? this.labelColor,
      buttonTextColor: buttonTextColor ?? this.buttonTextColor,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      margin: margin ?? this.margin,
      borderColor: borderColor ?? this.borderColor,
      text: text ?? this.text,
      error: error ?? this.error,
    );
  }
}
