import 'package:flutter/material.dart';

@immutable
abstract class DiaryFormEvent {}

class ErrorEvent extends DiaryFormEvent {
  final String error;

  ErrorEvent(this.error);
}

class TitleFocusEvent extends DiaryFormEvent {
  final bool titleHasFocus;

  TitleFocusEvent(this.titleHasFocus);
}

class TitleTextEvent extends DiaryFormEvent {
  final String titleText;

  TitleTextEvent(this.titleText);
}

class DescriptionTextEvent extends DiaryFormEvent {
  final String descriptionText;

  DescriptionTextEvent(this.descriptionText);
}

class DescriptionFocusEvent extends DiaryFormEvent {
  final bool descriptionHasFocus;

  DescriptionFocusEvent(this.descriptionHasFocus);
}

class SubmitEvent extends DiaryFormEvent {}
