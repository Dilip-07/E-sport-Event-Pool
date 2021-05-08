import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user/Screens/Userdashboard/components/on_tapped_tournaments.dart';

class Tournament extends StatefulWidget {
  @override
  _TournamentState createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Tournaments'.toUpperCase(),
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xff333951)),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('Tournaments').snapshots(),
        builder: (context, snapshots) {
          if (snapshots.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshots.data.docs.length <= 0) {
            return Center(
              child: Text("No Tournaments are avaiable yet...!"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshots.data.docs.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OnTappedTournaments(
                                  docId: snapshots.data.docs[index].id,
                                )));
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.only(),
                              child: CachedNetworkImage(
                                imageUrl: snapshots.data.docs[index]['image2'],
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    child: Text(
                                  snapshots
                                      .data.docs[index]['organization-name']
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 10),
                                Container(
                                    child: Text(
                                  snapshots.data.docs[index]['tournament-name'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: <Widget>[
                                SizedBox(width: 10),
                                Container(
                                    child: Text(
                                  snapshots.data.docs[index]['date'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
