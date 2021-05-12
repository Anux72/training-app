import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:training_app/db/models/child.dart';
import 'package:training_app/db/repo/child_repository.dart';
import 'diary_form_page.dart';

class DiaryFormView extends StatelessWidget {
  final TextEditingController titleText = TextEditingController();
  final TextEditingController descriptionText = TextEditingController();
  static final log = Log("DiaryFormView");
  final childRepo = ChildRepository();
  final String nickName;

  DiaryFormView(this.nickName) : super();

  @override
  Widget build(BuildContext context) {
    final diaryFormBloc = BlocProvider.of<DiaryFormBloc>(context);
    log.d("Loading DiaryForm View");

    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
      child: BlocBuilder<DiaryFormBloc, DiaryFormState>(
        buildWhen: (pre, current) =>
            (!pre.titleHasFocus &&
                current.titleHasFocus &&
                !pre.descriptionHasFocus &&
                current.titleText.isEmpty &&
                current.descriptionText.isEmpty) ||
            (current.titleText.isEmpty &&
                current.descriptionText.isEmpty &&
                !current.titleHasFocus &&
                !current.descriptionHasFocus),
        builder: (context, state) => Column(
          children: [
            AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(
                milliseconds: 400,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0x4473a9f5),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              margin:
                  EdgeInsets.fromLTRB(25, 0, state.titleHasFocus ? 25 : 200, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Focus(
                child: TextFormField(
                  controller: titleText,
                  onChanged: (value) =>
                      diaryFormBloc.add(TitleTextEvent(value)),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Submit New",
                    hintStyle: TextStyle(
                      color: Colors.black26,
                      fontSize: 22,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                onFocusChange: (hasFocus) {
                  diaryFormBloc.add(TitleFocusEvent(hasFocus));
                },
              ),
            ),
            Column(
              children: [
                AnimatedContainer(
                  height: state.titleHasFocus ? 150 : 0,
                  duration: Duration(
                    milliseconds: 400,
                  ),
                  curve: Curves.easeIn,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(25, 15, 25, 0),
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 30),
                  decoration: BoxDecoration(
                    color: Color(0x4473a9f5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Focus(
                    child: TextFormField(
                      onChanged: (value) =>
                          diaryFormBloc.add(DescriptionTextEvent(value)),
                      controller: descriptionText,
                      textAlignVertical: TextAlignVertical.top,
                      expands: false,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontSize: 22,
                        ),
                        hintText: "Description",
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    onFocusChange: (hasFocus) {
                      diaryFormBloc.add(DescriptionFocusEvent(hasFocus));
                    },
                  ),
                ),
                AnimatedContainer(
                  height: state.titleHasFocus ? 50 : 0,
                  duration: Duration(
                    milliseconds: 400,
                  ),
                  curve: Curves.easeIn,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(25, 15, 25, 0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff1689cc)),
                      overlayColor: MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.pressed)
                            ? Color(0x15ffffff)
                            : null;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (titleText.text.isNotEmpty &&
                          descriptionText.text.isNotEmpty) {
                        final child = Child(
                          title: titleText.text,
                          subtitle: nickName,
                          description: descriptionText.text,
                          timestamp: Timestamp.now().millisecondsSinceEpoch,
                          cardColor: 0xffe6ffff,
                        );
                        childRepo.add(item: child);
                        titleText.clear();
                        descriptionText.clear();
                        FocusScope.of(context).focusedChild.unfocus();
                        diaryFormBloc.add(SubmitEvent());
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
