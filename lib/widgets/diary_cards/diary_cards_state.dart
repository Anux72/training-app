import 'package:flutter/material.dart';
import 'package:training_app/db/models/child.dart';

@immutable
class DiaryCardsState {
  final List<Child> children;
  final String error;

  DiaryCardsState({
    @required this.children,
    @required this.error,
  });

  static DiaryCardsState get initialState => DiaryCardsState(
        children: null,
        error: '',
      );

  DiaryCardsState clone({
    List<Child> children,
    String error,
  }) {
    return DiaryCardsState(
      children: children ?? this.children,
      error: error ?? this.error,
    );
  }
}
