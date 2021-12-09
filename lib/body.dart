import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_news_aap/model/Articals.dart';
import 'package:my_news_aap/network.dart';
import 'package:my_news_aap/screen/descriptions.dart';

import 'constant.dart';



class AllNews extends StatefulWidget {
  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  // @override
  // void initState() {
  //   super.initState();
  //   _newsData();
  // }

  Future<List<Articals>> _newsData() async {
    NetworkHelper networkHelper = NetworkHelper(
        url: 'https://newsapi.org/v2/top-headlines?country=In&apiKey=$apikey');
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
      future: _newsData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child:GestureDetector(
                  onTap: () {
                    Get.to( Description(
                      img: snapshot.data[index].urlToImage,
                      des: snapshot.data[index].description,
                      content: snapshot.data[index].content,
                    ));
                  },
                child: Column(
                  children: [
                    Text(
                      snapshot.data[index].title,
                      style:KTextHeadline,
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
        }

    ));
  }
}

class NewsImage extends StatelessWidget {
  final String url;

  NewsImage(this.url);

  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        height: 250,
       child:Image.network(url),
        //snapshot.data[index].urlToImage
      );
    }
    catch (e) {
      return Container(
        height: 250,
        child:Image.network(
            'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg'),
        //snapshot.data[index].urlToImage
      );
    }
  }
}