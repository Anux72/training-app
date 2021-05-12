import 'package:flutter/material.dart';
import 'package:training_app/db/models/child.dart';

@immutable
abstract class DiaryCardsEvent {}

class ErrorEvent extends DiaryCardsEvent {
  final String error;

  ErrorEvent(this.error);
}

class ChangeChildrenEvent extends DiaryCardsEvent {
  final List<Child> children;

  ChangeChildrenEvent(this.children);
}
