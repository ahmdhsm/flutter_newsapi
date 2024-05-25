import 'package:flutter_newsapi/core/mapper/data_mapper.dart';
import 'package:flutter_newsapi/features/news/data/models/news_response_model.dart';
import 'package:flutter_newsapi/features/news/domain/entities/news_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_list_response_model.g.dart';

@JsonSerializable()
class NewsListResponseModel extends DataMapper<NewsListEntity> {
  NewsListResponseModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  String? status;
  int? totalResults;
  List<NewsResponseModel>? articles;

  factory NewsListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsListResponseModelFromJson(json);

  @override
  NewsListEntity mapToEntity() {
    return NewsListEntity(
      articles: articles?.map((e) => e.mapToEntity()).toList() ?? [],
      status: status ?? '',
      totalResults: totalResults ?? 0,
    );
  }
}
