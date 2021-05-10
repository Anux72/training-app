import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';

import '../diary_home.dart';
import 'root_event.dart';
import 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  static final log = Log("RootBloc");

  RootBloc(BuildContext context) : super(RootState.initialState);

  @override
  Stream<RootState> mapEventToState(RootEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        log.e('Error: $error');
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;

      case TextChangeEvent:
        final text = (event as TextChangeEvent).text;
        if (text != "") {
          yield state.clone(
            text: text,
            borderColor: Color(0xff1689cc),
            labelColor: Colors.grey,
            buttonBackgroundColor: Color(0xff1689cc),
            buttonTextColor: Colors.white,
            margin: 14,
          );
        } else {
          yield state.clone(
            text: text,
            borderColor: Colors.red,
            labelColor: Colors.red,
            buttonBackgroundColor: Color(0x66bfbfbf),
            buttonTextColor: Color(0x22000000),
            margin: 0,
          );
        }
        break;

      case RandomEvent:
        final controller = (event as RandomEvent).controller;
        final focusNode = (event as RandomEvent).focusNode;

        String randomName = "";
        while (controller.text == randomName || randomName == "") {
          final _random = new Random();
          final index = _random.nextInt(5);
          randomName = state.randomNickNames[index];
        }
        controller.text = randomName;
        focusNode.unfocus();
        yield state.clone(
          text: randomName,
          borderColor: Color(0xff1689cc),
          labelColor: Colors.grey,
          buttonBackgroundColor: Color(0xff1689cc),
          buttonTextColor: Colors.white,
          margin: 14,
        );
        break;

      case ContinueEvent:
        final controller = (event as ContinueEvent).controller;
        final focusNode = (event as ContinueEvent).focusNode;
        final context = (event as ContinueEvent).context;

        final text = controller.text;
        focusNode.unfocus();
        controller.clear();
        yield state.clone(
          text: "",
          borderColor: Colors.red,
          labelColor: Colors.red,
          buttonBackgroundColor: Color(0x66bfbfbf),
          buttonTextColor: Color(0x22000000),
          margin: 0,
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return DiaryHome(text);
            },
          ),
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
