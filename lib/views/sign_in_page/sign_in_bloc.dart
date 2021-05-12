import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';

import 'sign_in_page.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  static final log = Log("SignInBloc");

  SignInBloc(BuildContext context) : super(SignInState.initialState);

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;

      case TextChangeEvent:
        final text = (event as TextChangeEvent).text;
        yield state.clone(text: text);
        break;

      case RandomEvent:
        final randomName = (event as RandomEvent).randomName;
        yield state.clone(
          text: randomName,
        );
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
