import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:training_app/db/models/child.dart';
import 'package:training_app/db/repo/child_repository.dart';

import 'diary_form_event.dart';
import 'diary_form_state.dart';

class DiaryFormBloc extends Bloc<DiaryFormEvent, DiaryFormState> {
  static final log = Log("DiaryFormBloc");
  final childRepo = ChildRepository();
  final String nickName;

  DiaryFormBloc(this.nickName, BuildContext context)
      : super(DiaryFormState.initialState);

  @override
  Stream<DiaryFormState> mapEventToState(DiaryFormEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case TitleFocusEvent:
        final hasFocus = (event as TitleFocusEvent).titleHasFocus;
        final focusNode = (event as TitleFocusEvent).focusNode;
        if (hasFocus) {
          yield state.clone(
              titleHasFocus: hasFocus,
              margin: 25,
              descriptionHeight: 150,
              buttonHeight: 50);
        } else if (state.titleText == "" &&
            state.descriptionText == "" &&
            !focusNode.hasFocus) {
          yield state.clone(
              titleHasFocus: hasFocus,
              margin: 200,
              descriptionHeight: 0,
              buttonHeight: 0);
        } else {
          yield state.clone(titleHasFocus: hasFocus);
        }
        break;
      case DescriptionFocusEvent:
        final hasFocus = (event as DescriptionFocusEvent).descriptionHasFocus;
        final focusNode = (event as DescriptionFocusEvent).focusNode;
        if (hasFocus) {
          yield state.clone(titleHasFocus: hasFocus);
        } else if (state.titleText == "" &&
            state.descriptionText == "" &&
            !focusNode.hasFocus) {
          yield state.clone(
              titleHasFocus: hasFocus,
              margin: 200,
              descriptionHeight: 0,
              buttonHeight: 0);
        } else {
          yield state.clone(titleHasFocus: hasFocus);
        }
        break;
      case TitleTextEvent:
        final titleText = (event as TitleTextEvent).titleText;
        yield (state.clone(titleText: titleText));
        break;
      case DescriptionTextEvent:
        final descriptionText = (event as DescriptionTextEvent).descriptionText;
        yield (state.clone(descriptionText: descriptionText));
        break;
      case SubmitEvent:
        final titleText = (event as SubmitEvent).titleText;
        final descriptionText = (event as SubmitEvent).descriptionText;
        final titleFocusNode = (event as SubmitEvent).titleFocusNode;
        final descriptionFocusNode =
            (event as SubmitEvent).descriptionFocusNode;
        if (state.titleText != "" && state.descriptionText != "") {
          final child = Child(
            title: state.titleText,
            subtitle: nickName,
            description: state.descriptionText,
            timestamp: Timestamp.now().millisecondsSinceEpoch,
            cardColor: 0xffe6ffff,
          );
          childRepo.add(item: child);
          titleText.clear();
          descriptionText.clear();
          yield state.clone(
              titleHasFocus: titleFocusNode.hasFocus,
              descriptionHasFocus: descriptionFocusNode.hasFocus,
              titleText: "",
              descriptionText: "",
              margin: 200,
              buttonHeight: 0,
              descriptionHeight: 0);
        }
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
