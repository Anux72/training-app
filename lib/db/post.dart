import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  static Post _post;

  CollectionReference _connection;

  Post() {
    _connection = FirebaseFirestore.instance.collection("Diaries/");
  }

  static Post getInstance(){
    return _post == null ? _post = Post():_post;
  }

  CollectionReference getConnection () {
    return _connection;
  }

}
