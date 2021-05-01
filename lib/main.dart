import 'package:flutter/material.dart';

import './diaryCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: double.infinity,
        color: Colors.lightBlue,
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Flutter App',
              ),
            ),
            DiaryCard(
              title: 'Learning English is important',
              subtitle: 'Noah',
              description:
                  'English may not be the most spoken language in the world, but it is the official language of 53 countries and spoken by more than 360 million people',
              cardColor: 0xffe6ffff,
            ),
          ],
        ),
      ),
    );
  }
}
