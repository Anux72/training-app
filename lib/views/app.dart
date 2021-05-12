import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_in_page/sign_in_page.dart';

class App extends StatelessWidget {
  // This widget is the SignIn of your application.
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
      child: FutureBuilder<FirebaseApp>(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return MaterialApp(
              title: 'Fcode Demo App',
              home: SignInProvider(),
            );
          }),
    );
  }
}
