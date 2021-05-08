import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text(
            'Bookmarks'.toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff333951)),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
    );
  }
}
