import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/diary_cards/diary_cards_page.dart';
import 'widgets/diary_form/diary_form_page.dart';

class DiaryHome extends StatelessWidget {
  final String _text;

  DiaryHome(this._text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "./assets/images/background.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(25, 125, 0, 0),
                child: Text(
                  'Home',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  //textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(25, 30, 0, 40),
                child: Text(
                  'You are here: Home',
                  style: GoogleFonts.roboto(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                ),
              ),
              DiaryFormProvider(_text),
              DiaryCardsProvider(),
            ],
          ),
        ),
      ),
    );
  }
}
