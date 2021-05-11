import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class OnTappedTournaments extends StatefulWidget {
  final String docId;

  const OnTappedTournaments({Key key, @required this.docId}) : super(key: key);
  @override
  _OnTappedTournamentsState createState() => _OnTappedTournamentsState();
}

class _OnTappedTournamentsState extends State<OnTappedTournaments> {
  Color kPrimaryColor = Color(0xFF0C9869);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Feather.chevron_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          "Tournaments Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        // width: 300,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 22,
              color: kPrimaryColor.withOpacity(0.22),
            ),
            BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: Colors.white,
            ),
          ],
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
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl: doc.data['image2'],
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          "Torunaments Name: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "${doc.data['game']}".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          "Organization Name: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "${doc.data['organization-name']}".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          "Game Name: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "${doc.data['game']}".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          "Start Date: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "${doc.data['start-date']}".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          "End Date: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "${doc.data['end-date']}".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(),
                    ExpansionTile(
                      title: Text(
                        "Organization Info: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      children: [
                        Text(
                          "${doc.data['organization-info']}",
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Divider(),
                    ExpansionTile(
                      title: Text(
                        "Tournaments Details: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      children: [
                        Text(
                          "${doc.data['tournament-details']}",
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Divider(),
                    ExpansionTile(
                      title: Text(
                        "Tournaments Rules: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      children: [
                        Text(
                          "${doc.data['rules']}",
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Divider(),
                    ExpansionTile(
                      title: Text(
                        "Tournaments Prize: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      children: [
                        Text(
                          "${doc.data['prize-pool']}",
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Divider(),
                    ExpansionTile(
                      title: Text(
                        "Contact Venue: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      children: [
                        Text(
                          "${doc.data['contact-venue']}",
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
