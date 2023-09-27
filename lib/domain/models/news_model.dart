import 'package:badaro_test/domain/value_objects/news/news_content_value.dart';
import 'package:badaro_test/domain/value_objects/news/news_icon_slug_value.dart';
import 'package:badaro_test/domain/value_objects/news/news_redirect_uri_value.dart';
import 'package:badaro_test/domain/value_objects/news/news_thumbnail_value.dart';
import 'package:badaro_test/domain/value_objects/news/news_title_value.dart';

class NewsModel {
  final NewsContentValue contentValue;
  final NewsRedirectUriValue redirectUriValue;
  final NewsTitleValue titleValue;
  final NewsThumbnailValue thumbnailValue;
  final NewsIconSlugValue iconSlugValue;

  NewsModel({
    required this.contentValue,
    required this.redirectUriValue,
    required this.titleValue,
    required this.thumbnailValue,
    required this.iconSlugValue,
  });
}
