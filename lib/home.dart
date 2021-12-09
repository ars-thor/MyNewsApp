import 'package:flutter/material.dart';
import 'package:my_news_aap/body.dart';
import 'package:get/get.dart';
import 'package:my_news_aap/screen/business_news_screen.dart';
import 'package:my_news_aap/screen/entertainment.dart';
import 'package:my_news_aap/screen/sports.dart';
import 'package:my_news_aap/screen/healthnews.dart';

import 'screen/general_news.dart';
import 'screen/science_news.dart';
import 'screen/technology_news.dart';

enum MenuButton { setting, myProfile }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LearningGetx _learningGetX = Get.put(LearningGetx());
  @override
  void initState() {
    super.initState();
    _learningGetX.setNumber(15);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff29cccc),
        centerTitle: true,
        title: Text('Todays News Headlines'),
        actions: [
          PopupMenuButton<MenuButton>(
              onSelected: (value) {},
              //initialValue: ,
              itemBuilder: (context) {
                return <PopupMenuEntry<MenuButton>>[
                  PopupMenuItem<MenuButton>(child: Text("My Profile")),
                  PopupMenuItem<MenuButton>(child: Text("Setting")),
                ];
              }),
        ],
        bottom: TabBar(
          tabs: [
            Tab(
              text: "AllNews",
            ),
            Tab(
              text: "Business",
            ),
            Tab(
              text: "Sports",
            ),
            Tab(
              text: "Entertainments",
            ),
            Tab(
              text: "Health",
            ),
            // Tab(
            //   text: "General",
            // ),
            Tab(
              text: "Technology",
            ),
            // Tab(
            //   text: "Science",
            // )
          ],
        ),
      ),
      body: TabBarView(children: [
        AllNews(),
        BusinessNews(),
        SportsNews(),
        EntertainmentNews(),
        HealthNews(),
        // GeneralNews(),
        TechnologyNews(),
        // ScienceNews()
      ]),
    );
  }
}

class LearningGetx {
  int number;
  LearningGetx({this.number});
  setNumber(int n) => this.number = n;
  getNumber() => this.number;
}
