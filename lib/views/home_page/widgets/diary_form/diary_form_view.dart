import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'diary_form_bloc.dart';
import 'diary_form_page.dart';
import 'diary_form_state.dart';

class DiaryFormView extends StatelessWidget {
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  final TextEditingController titleText = TextEditingController();
  final TextEditingController descriptionText = TextEditingController();
  static final log = Log("DiaryFormView");

  @override
  Widget build(BuildContext context) {
    final diaryFormBloc = BlocProvider.of<DiaryFormBloc>(context);
    log.d("Loading DiaryForm View");

    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
      child: BlocBuilder<DiaryFormBloc, DiaryFormState>(
        buildWhen: (pre, current) => pre.margin != current.margin,
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
              margin: EdgeInsets.fromLTRB(25, 0, state.margin, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Focus(
                child: TextFormField(
                  controller: titleText,
                  focusNode: titleFocusNode,
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
                  diaryFormBloc.add(TitleFocusEvent(
                    hasFocus,
                    descriptionFocusNode,
                  ));
                },
              ),
            ),
            Column(
              children: [
                AnimatedContainer(
                  height: state.descriptionHeight,
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
                      focusNode: descriptionFocusNode,
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
                      diaryFormBloc.add(DescriptionFocusEvent(
                        hasFocus,
                        titleFocusNode,
                      ));
                    },
                  ),
                ),
                AnimatedContainer(
                  height: state.buttonHeight,
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
                    onPressed: () => diaryFormBloc.add(SubmitEvent(
                      titleText,
                      descriptionText,
                      titleFocusNode,
                      descriptionFocusNode,
                    )),
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
