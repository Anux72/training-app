import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_app/db/post.dart';

import '../diaryCard.dart';

class PostRepository {

  static void  add({title, subtitle, description, cardColor}) {
    Post.getInstance().getConnection().add({
      "title": title,
      "subtitle": subtitle,
      "description": description,
      "cardColor": cardColor,
      "timestamp": Timestamp
          .now()
          .millisecondsSinceEpoch,
    });
  }

  static StreamBuilder get(){
    return StreamBuilder(
      stream: Post.getInstance().getConnection().orderBy("timestamp", descending: false)
          .snapshots(),
      builder: (ctx, streamSnapShot) {
        if (streamSnapShot.connectionState ==
            ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(16),
          itemCount: streamSnapShot.data.docs.length,
          itemBuilder: (context, index) {
            final diaryCard = streamSnapShot.data.docs[index];
            return DiaryCard(
              title: diaryCard["title"],
              subtitle: diaryCard["subtitle"],
              description: diaryCard["description"],
              cardColor: diaryCard["cardColor"],
            );
          },
        );
      },
    );
  }

}