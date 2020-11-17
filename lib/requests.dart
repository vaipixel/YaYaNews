import 'dart:async';

import 'package:yaya_news/model.dart';
import 'package:yaya_news/network.dart';

class NewsRequest {
  StreamController<List<News>> controller = StreamController();

  Future<void> requestNews() async {
    var news = await getNews();
    controller.add(news.result.data);
  }

}