import 'package:flutter/material.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

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
          centerTitle: false,
          bottom: TabBar(
              labelPadding: EdgeInsets.all(0),
              indicatorColor: Theme.of(context).primaryColor,
              isScrollable: false,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey[500],
              indicatorWeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              indicator: MD2Indicator(
                indicatorHeight: 2,
                indicatorSize: MD2IndicatorSize.normal,
                indicatorColor: Theme.of(context).primaryColor,
              ),
              tabs: [
                Tab(
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'saved Games',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333951)),
                    ),
                  ),
                  //text: 'Saved Places',
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'saved Events',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff333951)),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
