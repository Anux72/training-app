import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/widgets/diary_card/diary_card_page.dart';

import 'diary_card_bloc.dart';
import 'diary_card_event.dart';

class DiaryCardView extends StatelessWidget {
  final String title;
  final String description;
  final String subtitle;
  final int cardColor;

  DiaryCardView({
    this.title,
    this.description,
    this.subtitle,
    this.cardColor,
  });

  static final log = Log("diary_cardView");

  @override
  Widget build(BuildContext context) {
    final diaryCardBloc = BlocProvider.of<DiaryCardBloc>(context);
    log.d("Loading diary_card View");

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color(cardColor),
      ),
      width: double.infinity,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              maxLines: 2,
              style: TextStyle(
                  color: Color(0xff353839),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.left,
            ),
            margin: EdgeInsets.all(7),
          ),
          Container(
            child: Text(
              subtitle,
              maxLines: 1,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.left,
            ),
            margin: EdgeInsets.fromLTRB(8, 0, 0, 20),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(8, 0, 0, 30),
            child: BlocBuilder<DiaryCardBloc, DiaryCardState>(
              buildWhen: (pre, current) =>
                  pre.descriptionLines != current.descriptionLines,
              builder: (context, state) => Text(
                description,
                maxLines: state.descriptionLines,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff353839),
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          TextButton(
            onPressed: () => diaryCardBloc.add(PressEvent()),
            child: BlocBuilder<DiaryCardBloc, DiaryCardState>(
              buildWhen: (pre, current) => pre.buttonText != current.buttonText,
              builder: (context, state) => Text(
                'Show ' + state.buttonText,
                style: TextStyle(
                  color: Color(0xff353839),
                  fontWeight: FontWeight.w700,
                  fontSize: 21,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
