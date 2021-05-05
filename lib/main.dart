import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/bloc/submit_BLoc.dart';
import 'package:training_app/diaryCard.dart';

import './diaryHome.dart';
import 'diaryHome.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubmitBloc>(
      create: (context) => SubmitBloc(List<DiaryCard>()),
      child: DiaryHome(),
    );
  }
}
