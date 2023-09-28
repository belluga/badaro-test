import 'package:badaro_test/domain/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsHighlight extends StatelessWidget {
  final NewsModel newsModel;

  const NewsHighlight({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Column(children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(newsModel.thumbnailValue.value.toString()),
            ),
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text(newsModel.titleValue.valueFormated))
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(newsModel.contentValue.valueText ?? ""))
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
