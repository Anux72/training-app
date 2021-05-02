import 'package:flutter/material.dart';

import './diaryCard.dart';
import './diaryForm.dart';

class DiaryHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/background.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                DiaryForm(),
                /*DiaryCard(
                title: 'Learning English is important',
                subtitle: 'Noah',
                description:
                    'English may not be the most spoken language in the world, but it is the official language of 53 countries and spoken by more than 360 million people',
                cardColor: 0xffe6ffff,
              ),*/
              ],
            ),
          ),
        ),
      );
  }
}
