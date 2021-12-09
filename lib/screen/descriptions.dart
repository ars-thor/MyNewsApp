import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_news_aap/body.dart';
import 'package:my_news_aap/constant.dart';

class Description extends StatelessWidget {
  final String img;
  final String des;
  final String content;
  Description({this.img, this.des, this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: Text('Todays News Headlines'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          margin: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black26),
                ),
                child: NewsImage(img),
              ),
              Container(
                child: Text(
                  des?? "Oops! ,Couldn't find anything ",
                  style: KTextHeadline,
                ),
              ),
              Text(
                content ?? "Oops! ,Couldn't find anything ",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
