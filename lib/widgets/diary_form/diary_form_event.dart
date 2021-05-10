import 'package:flutter/material.dart';

@immutable
abstract class DiaryFormEvent {}

class ErrorEvent extends DiaryFormEvent {
  final String error;

  ErrorEvent(this.error);
}

class TitleFocusEvent extends DiaryFormEvent {
  final bool titleHasFocus;
  final FocusNode focusNode;

  TitleFocusEvent(this.titleHasFocus, this.focusNode);
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
  final FocusNode focusNode;

  DescriptionFocusEvent(this.descriptionHasFocus, this.focusNode);
}

class SubmitEvent extends DiaryFormEvent {
  final FocusNode titleFocusNode;
  final TextEditingController titleText;
  final TextEditingController descriptionText;
  final FocusNode descriptionFocusNode;

  SubmitEvent(this.titleText, this.descriptionText, this.titleFocusNode,
      this.descriptionFocusNode);
}
