import 'package:flutter/material.dart';

@immutable
abstract class SignInEvent {}

class ErrorEvent extends SignInEvent {
  final String error;

  ErrorEvent(this.error);
}

class TextChangeEvent extends SignInEvent {
  final String text;

  TextChangeEvent(this.text);
}

class RandomEvent extends SignInEvent {
  final String randomName;

  RandomEvent(this.randomName);
}
