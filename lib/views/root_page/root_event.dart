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
  final TextEditingController controller;
  final FocusNode focusNode;

  RandomEvent(this.controller, this.focusNode);
}

class ContinueEvent extends RootEvent {
  final BuildContext context;
  final TextEditingController controller;
  final FocusNode focusNode;

  ContinueEvent(this.context, this.controller, this.focusNode);
}
