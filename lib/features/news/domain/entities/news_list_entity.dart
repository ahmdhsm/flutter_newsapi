import 'package:flutter_newsapi/features/news/domain/entities/news_entity.dart';

class NewsListEntity {
  NewsListEntity({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<NewsEntity> articles;
}
