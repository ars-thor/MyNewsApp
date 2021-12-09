import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:my_news_aap/constant.dart';
import 'package:my_news_aap/model/Articals.dart';
import 'package:my_news_aap/network.dart';

import '../body.dart';
import '../home.dart';
import 'descriptions.dart';

class SportsNews extends StatefulWidget {
  const SportsNews({Key key}) : super(key: key);

  @override
  _SportsNewsState createState() => _SportsNewsState();
}

class _SportsNewsState extends State<SportsNews> {
  LearningGetx learningGetx = Get.find();
  Future<List<Articals>> _bNewsData() async {
    print(learningGetx.getNumber());
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://newsapi.org/v2/top-headlines?country=In&category=sports&apiKey=$apikey');
    var data = await networkHelper.getData();
    List<Articals> articals = [];
    for (var jsData in data['articles']) {
      Articals artical = Articals(jsData["title"], jsData['urlToImage'],
          jsData['description'], jsData['publishedAt'], jsData['content']);
      articals.add(artical);
    }
    return articals;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: _bNewsData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(context,  MaterialPageRoute(
                          //     builder: (context) =>
                          // ));
                          Get.to(Description(
                            img: snapshot.data[index].urlToImage,
                            des: snapshot.data[index].description,
                            content: snapshot.data[index].content,
                          ));
                        },
                        child: Column(
                          children: [
                            Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            NewsImage(snapshot.data[index].urlToImage),
                            Text('Time:${snapshot.data[index].publishedAt}'),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
