import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_cards_bloc.dart';
import 'diary_cards_view.dart';

class DiaryCardsProvider extends BlocProvider<DiaryCardsBloc> {
  DiaryCardsProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => DiaryCardsBloc(context),
          child: DiaryCardsView(),
        );
}
