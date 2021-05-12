import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_page.dart';

class SignInProvider extends BlocProvider<SignInBloc> {
  SignInProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => SignInBloc(context),
          child: SignInView(),
        );
}
