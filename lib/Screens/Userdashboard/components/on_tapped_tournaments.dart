import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OnTappedTournaments extends StatefulWidget {
  final String docId;

  const OnTappedTournaments({Key key, @required this.docId}) : super(key: key);
  @override
  _OnTappedTournamentsState createState() => _OnTappedTournamentsState();
}

class _OnTappedTournamentsState extends State<OnTappedTournaments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {}),
        title: Text("Tournaments Details"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Tournaments")
              .doc(widget.docId)
              .snapshots(),
          builder: (context, doc) {
            if (doc.data == null) {
              return Container();
            } else {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: doc.data.docs['image2'],
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ]);
            }
          },
        ),
      ),
    );
  }
}
