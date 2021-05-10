import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fcode_bloc/fcode_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:training_app/db/models/child.dart';

import '../../db_util.dart';

class ChildRepository extends FirebaseRepository<Child> {
  @override
  Child fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data();
    return Child(
      cardColor: data[Child.CARDCOLOR_FIELD],
      description: data[Child.DESCRIPTION_FIELD],
      subtitle: data[Child.SUBTITLE_FIELD],
      timestamp: data[Child.TIME_FIELD],
      title: data[Child.TITLE_FIELD],
    );
  }

  @override
  Map<String, dynamic> toMap(Child item) {
    return {
      'title': item.title,
      'subtitle': item. subtitle,
      'description': item.description,
      'timestamp': item.timestamp,
      'cardColor': item.cardColor
    };
  }

  @override
  Stream<List<Child>> query({
    @required SpecificationI specification,
    String type,
    DocumentReference parent,
  }) {
    return super.query(
      specification: specification,
      type: CHILD,
      parent: null,
    );
  }

  @override
  Future<DocumentReference> add({
    @required Child item,
    String type,
    DocumentReference parent,
  }) {
    return super.add(
      item: item,
      type: CHILD,
      parent: null,
    );
  }

}
