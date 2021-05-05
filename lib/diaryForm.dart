import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:training_app/bloc/submit_BLoc.dart';
import 'package:training_app/db/PostRepository.dart';
import 'package:training_app/events/submit_event.dart';

import './diaryCard.dart';

class DiaryForm extends StatefulWidget {
  final _formTitleController = TextEditingController();
  final _formDescriptionController = TextEditingController();
  double _titleLength = 200;
  var _titleFocused = false;
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  @override
  State<StatefulWidget> createState() {
    return DiaryFormState();
  }
}

class DiaryFormState extends State<DiaryForm> {
  void clickHandler() {
    if (widget._formTitleController.text != "" &&
        widget._formDescriptionController.text != "") {
      PostRepository.add(
        title: widget._formTitleController.text,
        subtitle: "Noah",
        description: widget._formDescriptionController.text,
        cardColor: 0xffe6ffff,
      );
      /*FirebaseFirestore.instance.collection("Diaries").add(
        {
          "title": widget._formTitleController.text,
          "subtitle": "Noah",
          "description": widget._formDescriptionController.text,
          "cardColor": 0xffe6ffff,
          "timestamp": Timestamp.now().millisecondsSinceEpoch,
        },
      );*/
      /*BlocProvider.of<SubmitBloc>(context).add(
        SubmitEvent(
          DiaryCard(
            title: widget._formTitleController.text,
            subtitle: "Noah",
            description: widget._formDescriptionController.text,
            cardColor: 0xffe6ffff,
          ),
        ),
      );*/
      widget._formTitleController.clear();
      widget._formDescriptionController.clear();
      setState(() {
        FocusScope.of(context).unfocus();
        widget._titleFocused = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x4473a9f5),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            margin: EdgeInsets.fromLTRB(25, 0, widget._titleLength, 0),
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Focus(
              child: TextFormField(
                focusNode: widget._titleFocusNode,
                controller: widget._formTitleController,
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
                if (hasFocus) {
                  setState(() {
                    widget._titleFocused = true;
                    widget._titleLength = 25;
                  });
                } else if (!widget._descriptionFocusNode.hasFocus &&
                    widget._formTitleController.text == "" &&
                    widget._formDescriptionController.text == "") {
                  setState(() {
                    widget._titleFocused = false;
                    widget._titleLength = 200;
                  });
                }
              },
            ),
          ),
          (() {
            return widget._titleFocused
                ? Column(
                    children: [
                      Container(
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
                            controller: widget._formDescriptionController,
                            focusNode: widget._descriptionFocusNode,
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
                            if (!hasFocus &&
                                !widget._titleFocusNode.hasFocus &&
                                widget._formTitleController.text == "" &&
                                widget._formDescriptionController.text == "") {
                              setState(() {
                                widget._titleFocused = false;
                                widget._titleLength = 200;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(25, 15, 25, 0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: TextButton(
                          onPressed: clickHandler,
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
                  )
                : Container();
          }()),
        ],
      ),
    );
  }
}
