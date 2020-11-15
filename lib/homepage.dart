import "package:flutter/material.dart";
import "news.dart";
import 'package:intl/intl.dart';
import "player.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loadingInProgress;
  var newsList;
  void getNews() async {
    News news = News();
    await news.getNews();
    setState(() {
      loadingInProgress = false;
      newsList = news.news;
    });
  }

  @override
  void initState() {
    loadingInProgress = true;
    //todo: implement init state
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: loadingInProgress
              ? Center(
                  child: Text('Loading....'),
                )
              : Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text('Top HeadLines',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                    Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(newsList[index].title),
                            subtitle: Text(DateFormat.Hm()
                                .format(newsList[index].publishedAt)),
                            leading: Image.network(newsList[index].urltoimage),
                            trailing: PlayerWidget(
                              body: newsList[index].content,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
