import 'package:flutter/material.dart';

@immutable
class SignInState {
  final String text;
  final String error;

  SignInState({
    @required this.text,
    @required this.error,
  });

  static SignInState get initialState => SignInState(
        text: "",
        error: '',
      );

  SignInState clone({
    String text,
    String error,
  }) {
    return SignInState(
      text: text ?? this.text,
      error: error ?? this.error,
    );
  }
}
