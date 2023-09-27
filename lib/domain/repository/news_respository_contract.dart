import 'package:badaro_test/domain/models/news_model.dart';
import 'package:badaro_test/domain/repository/repository_contract.dart';
import 'package:stream_value/core/stream_value.dart';

abstract class NewsRepositoryContract implements RepositoryContract{
  final newsStream = StreamValue<List<NewsModel>?>();

  @override
  void dispose() {
    newsStream.dispose();
  }
}
