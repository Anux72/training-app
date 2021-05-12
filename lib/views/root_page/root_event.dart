import 'package:flutter/material.dart';

@immutable
abstract class RootEvent {}

class ErrorEvent extends RootEvent {
  final String error;

  ErrorEvent(this.error);
}

class TextChangeEvent extends RootEvent {
  final String text;

  TextChangeEvent(this.text);
}

class RandomEvent extends RootEvent {
  final String randomName;

  RandomEvent(this.randomName);
}
