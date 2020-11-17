import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yaya_news/core/viewmodel_provider.dart';
import 'package:yaya_news/model.dart';
import 'package:yaya_news/viewmodel/viewmodel.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Loading...');
  }
}

class NewsListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsListState();
  }
}

class NewsListState extends State<StatefulWidget> {
  NewsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    // _viewModel = ViewModelProvider.of(context);
    _viewModel = NewsViewModel();
    _viewModel.newsRequest.requestNews();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _viewModel.newsRequest.controller.stream,
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return LoadingWidget();
          else
            return ListView.separated(
              itemBuilder: (context, index) {
                return NewsOverviewWidget(snapshot.data[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 30,
                  color: Colors.transparent,
                );
              },
              itemCount: snapshot.data.length,
            );
        });
  }
}

class NoContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}

class NewsOverviewWidget extends StatelessWidget {
  News _news;

  NewsOverviewWidget(this._news);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 0,
              child: Text(_news.authorName),
            ),
            Expanded(
              flex: 1,
              child: Text(""),
            ),
            Expanded(
              flex: 0,
              child: Text(_news.date),
            ),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                _news.title,
                style: TextStyle(fontSize: 22),
                maxLines: 3,
              ),
            ),
            Expanded(
              flex: 0,
              child: Image(
                image: NetworkImage(_news.thumbnailPicS),
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
