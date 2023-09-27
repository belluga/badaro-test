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
}
