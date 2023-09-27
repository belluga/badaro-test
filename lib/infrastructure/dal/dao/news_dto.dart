import 'package:badaro_test/domain/models/news_model.dart';
import 'package:badaro_test/domain/value_objects/news/news_content_value.dart';
import 'package:badaro_test/domain/value_objects/news/news_icon_slug_value.dart';
import 'package:badaro_test/domain/value_objects/news/news_redirect_uri_value.dart';
import 'package:badaro_test/domain/value_objects/news/news_thumbnail_value.dart';
import 'package:badaro_test/domain/value_objects/news/news_title_value.dart';

class NewsDTO {
  final String title;
  final String content;
  final String thumbnailUrl;
  final String redirectUrl;
  final String iconSlug;

  NewsDTO({
    required this.title,
    required this.content,
    required this.thumbnailUrl,
    required this.redirectUrl,
    required this.iconSlug,
  });

  NewsModel toDomain() {
    return NewsModel(
      contentValue: NewsContentValue()..parse(content),
      iconSlugValue: NewsIconSlugValue()..parse(iconSlug),
      redirectUriValue: NewsRedirectUriValue()..parse(redirectUrl),
      thumbnailValue: NewsThumbnailValue()..parse(thumbnailUrl),
      titleValue: NewsTitleValue()..parse(title),
    );
  }

  factory NewsDTO.fromJson(Map<String, dynamic> json) {
    final String _title = json["title"];
    final String _content = json["content"];
    final String _thumbnailUrl = json["thumbnail_url"];
    final String _redirectUrl = json["redirect_url"];
    final String _iconSlug = json["icon_slug"];

    return NewsDTO(
      content: _content,
      iconSlug: _iconSlug,
      redirectUrl: _redirectUrl,
      thumbnailUrl: _thumbnailUrl,
      title: _title,
    );
  }
}
