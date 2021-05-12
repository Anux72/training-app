import 'dart:math';

import 'package:fcode_common/fcode_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/views/home_page/home_page.dart';
import 'package:training_app/views/root_page/root_event.dart';

import 'root_bloc.dart';
import 'root_state.dart';

class RootView extends StatelessWidget {
  static final log = Log("RootView");

  final controller = TextEditingController();
  final focusNode = FocusNode();
  static const randomNickNames = [
    "James",
    "William",
    "Noah",
    "Logan",
    "Benjamin"
  ];

  @override
  Widget build(BuildContext context) {
    final rootBloc = BlocProvider.of<RootBloc>(context);
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
        child: Column(
          children: [
            BlocBuilder<RootBloc, RootState>(
              buildWhen: (pre, current) =>
                  (pre.text.isNotEmpty && current.text.isEmpty) ||
                  (pre.text.isEmpty && current.text.isNotEmpty),
              builder: (context, state) {
                return Container(
                  margin: EdgeInsets.fromLTRB(
                      0, 85.0 + (state.text.isEmpty ? 0 : 14), 0, 30),
                  child: Text(
                    "Dear Diary",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 65),
              decoration: BoxDecoration(
                color: Color(0xddffffff),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 48),
                    width: double.infinity,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xff1689cc),
                        fontSize: 45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: BlocBuilder<RootBloc, RootState>(
                      buildWhen: (pre, current) =>
                          (pre.text.isNotEmpty && current.text.isEmpty) ||
                          (pre.text.isEmpty && current.text.isNotEmpty),
                      builder: (context, state) {
                        return TextFormField(
                          controller: controller,
                          focusNode: focusNode,
                          onChanged: (value) =>
                              rootBloc.add(TextChangeEvent(value)),
                          style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: state.text.isEmpty
                                  ? Colors.red
                                  : Color(0xff1689cc),
                            )),
                            contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            labelText: "Your Nickname*",
                            labelStyle: TextStyle(
                              height: 0.5,
                              color:
                                  state.text.isEmpty ? Colors.red : Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          textAlignVertical: TextAlignVertical.bottom,
                        );
                      },
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0x66000000),
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                  BlocBuilder<RootBloc, RootState>(
                    buildWhen: (pre, current) =>
                        (pre.text.isNotEmpty && current.text.isEmpty) ||
                        (pre.text.isEmpty && current.text.isNotEmpty),
                    builder: (context, state) {
                      return state.text.isEmpty
                          ? Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(40, 0, 0, 20),
                              child: Text(
                                "Required",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : Container();
                    },
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                    child: TextButton(
                      onPressed: () => () {
                        String randomName = "";
                        while (controller.text == randomName ||
                            randomName.isEmpty) {
                          final _random = new Random();
                          final index = _random.nextInt(5);
                          randomName = randomNickNames[index];
                        }
                        controller.text = randomName;
                        focusNode.unfocus();
                        rootBloc.add(RandomEvent(randomName));
                      }(),
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.resolveWith((states) {
                          return states.contains(MaterialState.pressed)
                              ? Color(0x55ffffff)
                              : null;
                        }),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(14)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff1689cc)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      child: Text(
                        "RANDOM",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: BlocBuilder<RootBloc, RootState>(
                      buildWhen: (pre, current) =>
                          (pre.text.isNotEmpty && current.text.isEmpty) ||
                          (pre.text.isEmpty && current.text.isNotEmpty),
                      builder: (context, state) {
                        return TextButton(
                          onPressed: state.text.isNotEmpty
                              ? () => () {
                                    final text = controller.text;
                                    focusNode.unfocus();
                                    controller.clear();
                                    rootBloc.add(TextChangeEvent(""));
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return DiaryHome(text);
                                        },
                                      ),
                                    );
                                  }()
                              : null,
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.resolveWith((states) {
                              return states.contains(MaterialState.pressed)
                                  ? Color(0x55ffffff)
                                  : null;
                            }),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.all(14)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              state.text.isEmpty
                                  ? Color(0x66bfbfbf)
                                  : Color(0xff1689cc),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                          child: Text(
                            "CONTINUE \u{2794}",
                            style: TextStyle(
                              fontSize: 22,
                              color: state.text.isEmpty
                                  ? Color(0x22000000)
                                  : Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
