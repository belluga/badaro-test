import 'package:badaro_test/domain/models/news_model.dart';
import 'package:badaro_test/presentation/home/widgets/news_personalized_card.dart';
import 'package:flutter/material.dart';

class NewsPersonalized extends StatelessWidget {
  final List<NewsModel> newsList;

  const NewsPersonalized({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    final _double = MediaQuery.of(context).size.width;
    final _cardSize80percent = _double * 0.80;

    return SizedBox(
      height: 130,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => NewsPersonalizedCard(
          width:_cardSize80percent,
          newsModel: newsList[i]),
        itemCount: newsList.length,
        separatorBuilder: (_, i) => const SizedBox(
          width: 16,
        ),
      ),
    );
  }
}
