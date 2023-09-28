import 'package:badaro_test/domain/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPersonalizedCard extends StatelessWidget {
  final NewsModel newsModel;
  final double width;

  const NewsPersonalizedCard({
    super.key,
    required this.newsModel,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        newsModel.thumbnailValue.value.toString(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child:
                                            Text(newsModel.titleValue.value)),
                                    IconButton(
                                        onPressed: _launchUrl,
                                        icon: Icon(Icons.launch))
                                  ],
                                ),
                                Text(newsModel.contentValue.valueText ?? ""),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri? _uri = newsModel.redirectUriValue.value;

    if (_uri != null) {
      if (await canLaunchUrl(_uri)) {
        launchUrl(_uri);
      }
    }
  }
}
