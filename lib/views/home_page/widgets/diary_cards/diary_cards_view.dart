import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/views/home_page/widgets/diary_card/diary_card_page.dart';

import 'diary_cards_page.dart';

class DiaryCardsView extends StatelessWidget {
  static final log = Log("DiaryCardsView");

  @override
  Widget build(BuildContext context) {
    log.d("Loading DiaryCards View");

    return BlocBuilder<DiaryCardsBloc, DiaryCardsState>(
      buildWhen: (pre, current) => !identical(pre.children, current.children),
      builder: (context, state) {
        if (state.children == null) {
          return Container();
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          itemCount: state.children.length,
          itemBuilder: (context, index) {
            final diaryCard = state.children[index];
            return DiaryCardProvider(
              title: diaryCard.title,
              subtitle: diaryCard.subtitle,
              description: diaryCard.description,
              cardColor: diaryCard.cardColor,
            );
          },
        );
      },
    );
  }
}
