import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_app/diaryCard.dart';
import 'package:training_app/events/submit_event.dart';

class SubmitBloc extends Bloc<SubmitEvent, List<DiaryCard>>{

  SubmitBloc(List<DiaryCard> initialState) : super(initialState);

  @override
  Stream<List<DiaryCard>> mapEventToState(SubmitEvent event) async*{
    List<DiaryCard> newState = List.from(state);
    if(event.diaryCard != null) {
      newState.add(event.diaryCard);
      yield newState;
    }
  }

}