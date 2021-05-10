import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:training_app/db/repo/child_repository.dart';

import 'diary_cards_event.dart';
import 'diary_cards_state.dart';

class DiaryCardsBloc extends Bloc<DiaryCardsEvent, DiaryCardsState> {
  static final log = Log("DiaryCardsBloc");
  final childRepo = ChildRepository();

  DiaryCardsBloc(BuildContext context) : super(DiaryCardsState.initialState) {
    childRepo
        .query(specification: ComplexSpecification([OrderBy("timestamp")]))
        .listen((children) {
      add(ChangeChildrenEvent(children));
    });
  }

  @override
  Stream<DiaryCardsState> mapEventToState(DiaryCardsEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ChangeChildrenEvent:
        final children = (event as ChangeChildrenEvent).children;
        yield state.clone(children: children);
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    log.e('$stacktrace');
    log.e('$error');
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) {
      return;
    }
    try {
      add(ErrorEvent(
        (e is String)
            ? e
            : (e.message ?? "Something went wrong. Please try again !"),
      ));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again !"));
    }
  }
}
