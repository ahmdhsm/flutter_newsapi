import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/features/news/domain/entities/news_list_entity.dart';

abstract class NewsRepository {
  Future<ApiResultModel<NewsListEntity>> getNewsList({
    required String query,
    required int page,
    int? itemPerPage = 10,
  });
}
