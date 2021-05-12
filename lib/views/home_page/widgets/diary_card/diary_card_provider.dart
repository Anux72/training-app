import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_card_page.dart';

class DiaryCardProvider extends BlocProvider<DiaryCardBloc> {
  DiaryCardProvider({
    Key key,
    String title,
    String subtitle,
    String description,
    int cardColor,
  }) : super(
          key: key,
          create: (context) => DiaryCardBloc(context),
          child: DiaryCardView(
            title: title,
            description: description,
            subtitle: subtitle,
            cardColor: cardColor,
          ),
        );
}
