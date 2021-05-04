import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_app/bloc/submit_BLoc.dart';

import './diaryCard.dart';
import './diaryForm.dart';

class DiaryHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: MaterialApp(
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
                      //textAlign: TextAlign.left,
                    ),
                  ),
                  DiaryForm(),
                  BlocConsumer<SubmitBloc, List<DiaryCard>>(
                    builder: (context, cardList) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(16),
                        itemCount: cardList.length,
                        itemBuilder: (context, index) {
                          return cardList[index];
                        },
                      );
                    },
                    listener: (BuildContext context, cardList) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
