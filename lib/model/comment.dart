import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String uid;
  String nickname;
  String imageUrl;
  String comment;
  String date;
  String timestamp;

  Comment(
      {this.uid,
      this.nickname,
      this.imageUrl,
      this.comment,
      this.date,
      this.timestamp});

  factory Comment.fromFirestore(QueryDocumentSnapshot snapshot) {
    var d = snapshot.data();
    return Comment(
      uid: d['Uid'],
      nickname: d['Nick Name'],
      imageUrl: d['Image'],
      comment: d['Comment'],
      date: d['date'],
      timestamp: d['timestamp'],
    );
  }
}
