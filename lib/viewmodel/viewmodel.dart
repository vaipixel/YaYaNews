import 'package:flutter/src/widgets/framework.dart';
import 'package:yaya_news/core/abstract_base_viewmodel.dart';
import 'package:yaya_news/requests.dart';

class NewsViewModel extends BaseViewModel {

  NewsRequest newsRequest = NewsRequest();

  @override
  void dispose() {}

  @override
  void doInit(BuildContext context) {}
}
