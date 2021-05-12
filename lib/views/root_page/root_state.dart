import 'package:flutter/material.dart';

@immutable
class RootState {
  final String text;
  final String error;

  RootState({
    @required this.text,
    @required this.error,
  });

  static RootState get initialState => RootState(
        text: "",
        error: '',
      );

  RootState clone({
    String text,
    String error,
  }) {
    return RootState(
      text: text ?? this.text,
      error: error ?? this.error,
    );
  }
}
