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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _news.authorName,
              style: TextStyle(
                color: Color.fromARGB(255, 146, 146, 146),
                fontSize: 12
              ),
            ),
            Text(
              _news.date,
              style: TextStyle(
                color: Color.fromARGB(255, 146, 146, 146),
                fontSize: 12
              ),
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
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
              ),
            ),
            Expanded(
              flex: 0,
              child: Image(
                image: NetworkImage(_news.thumbnailPicS),
                width: 70,
                height: 70,
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
