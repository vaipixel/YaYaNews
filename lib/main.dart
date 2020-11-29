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
          visualDensity: VisualDensity.adaptivePlatformDensity),
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

class _NewsHomeState extends State<NewsHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
        bottom: TabBar(
          // controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: null),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business), onPressed: null),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}

class NewsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: NewsListWidget(),
    );
  }
}
