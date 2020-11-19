import 'package:flutter/material.dart';
import 'package:yaya_news/model.dart';
import 'package:yaya_news/network.dart';
import 'package:yaya_news/views/home_view.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Color.fromARGB(255, 245, 247, 245),
      ),
      home: NewsHome(),
    );
  }
}

class NewsHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsHomeState();
  }
}

class _NewsHomeState extends State<NewsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsContainer(),
    );
  }
}

class NewsContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsContainerState();
  }
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NewsListWidget();
  }
}
