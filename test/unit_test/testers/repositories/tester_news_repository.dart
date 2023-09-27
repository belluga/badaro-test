import 'package:badaro_test/domain/models/news_model.dart';
import 'package:badaro_test/domain/repository/news_respository_contract.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

class TesterNewsRepository {
  late NewsRepositoryContract _newsRepository;

  TesterNewsRepository() {
    final getIt = GetIt.instance;
    _newsRepository = getIt<NewsRepositoryContract>();
  }

  void doTest() async {
    _newsRepository.init();

    test('ChatAgentDTO - OK', () async {
      final List<NewsModel>? _news = _newsRepository.newsStream.value;

      expect(_news?.length, 3);
      expect(_news?.first.titleValue.value, "A Maturidade digital das Empresas");
      expect(_news?.last.titleValue.value, "Google lança o Bard no Brasil: qual a diferença em relação ao Chat GPT?");
    });
  }
}
