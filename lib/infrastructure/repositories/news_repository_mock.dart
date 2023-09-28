import 'dart:convert';

import 'package:badaro_test/domain/models/news_model.dart';
import 'package:badaro_test/domain/repository/news_respository_contract.dart';
import 'package:badaro_test/infrastructure/dal/dao/news_dto.dart';

class NewsRepositoryMock extends NewsRepositoryContract {
  @override
  Future<void> init() async {
    await _retrieveNews();

    return Future.value();
  }

  Future<void> _retrieveNews() async {
    final String _json = _newsJson;
    final List _list = jsonDecode(_json);
    final List<NewsModel> _newsList = _list
        .map((e) => NewsDTO.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
    newsStream.addValue(_newsList);
  }

  String get _newsJson =>
      '[{"title":"A Maturidade digital das Empresas","content":"<p>Esse é um conteúdo qualquer que você deve <b>ler em negrito</b> e ponto.</p><´>E agora mais um parágrafo.</p><p>E pra constar, notícia #1.</p>","thumbnail_url":"https://miro.medium.com/v2/resize:fit:720/format:webp/1*5pyTi0agEKibA8aBu5CghA.png","redirect_url":"https://medium.com/@badaro.design/a-maturidade-digital-das-empresas-brasileiras-564217da117e","icon_slug":"news"},{"title":"Edtech: Tecnologia a favor de negócios de educação","content":"<p>Esse é um conteúdo qualquer que você deve <b>ler em negrito</b> e ponto.</p><´>E agora mais um parágrafo.</p><p>E pra constar, notícia #1.</p>","thumbnail_url":"https://miro.medium.com/v2/resize:fit:1400/format:webp/1*0rFyUP079wVxRHc5-gLVhw.png","redirect_url":"https://medium.com/@badaro.design/edtech-tecnologia-a-favor-de-neg%C3%B3cios-de-educa%C3%A7%C3%A3o-7ff3baf38cf","icon_slug":"news"},{"title":"Google lança o Bard no Brasil: qual a diferença em relação ao Chat GPT?","content":"<p>Esse é um conteúdo qualquer que você deve <b>ler em negrito</b> e ponto.</p><´>E agora mais um parágrafo.</p><p>E pra constar, notícia #1.</p>","thumbnail_url":"https://miro.medium.com/v2/resize:fit:1400/format:webp/1*0-aG2PKPxE42_uW8PqP88w.png","redirect_url":"https://medium.com/@badaro.design/google-lan%C3%A7a-o-bard-no-brasil-qual-a-diferen%C3%A7a-em-rela%C3%A7%C3%A3o-ao-chat-gpt-b09822daf81d","icon_slug":"news"}]';
}
