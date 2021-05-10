import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_form_bloc.dart';
import 'diary_form_view.dart';

class DiaryFormProvider extends BlocProvider<DiaryFormBloc> {
  DiaryFormProvider(
    String text, {
    Key key,
  }) : super(
          key: key,
          create: (context) => DiaryFormBloc(text, context),
          child: DiaryFormView(),
        );
}
