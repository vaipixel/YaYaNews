import 'package:dio/dio.dart';
import 'const.dart';
import 'model.dart';

Dio dio = new Dio();

Future<NewsResponse> getNews() async {
  Response r;
  r = await dio.get(HOST + "?" + QUERY_KEY + "=" + TOKEN + "&");
  return NewsResponse.fromJson(r.data);
}
