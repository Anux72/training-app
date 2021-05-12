import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/cupertino.dart';

import 'diary_form_page.dart';

class DiaryFormBloc extends Bloc<DiaryFormEvent, DiaryFormState> {
  static final log = Log("diary_formBloc");

  DiaryFormBloc(BuildContext context) : super(DiaryFormState.initialState);

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
        yield state.clone(titleHasFocus: hasFocus);
        break;

      case DescriptionFocusEvent:
        final hasFocus = (event as DescriptionFocusEvent).descriptionHasFocus;
        yield state.clone(descriptionHasFocus: hasFocus);
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
        yield state.clone(
          titleHasFocus: false,
          descriptionHasFocus: false,
          titleText: "",
          descriptionText: "",
        );
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
