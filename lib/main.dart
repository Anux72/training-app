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
            DiaryCard(),
          ],
        ),
      ),
    );
  }
}
