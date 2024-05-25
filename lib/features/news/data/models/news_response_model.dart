import 'package:flutter_newsapi/core/mapper/data_mapper.dart';
import 'package:flutter_newsapi/features/news/domain/entities/news_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel extends DataMapper<NewsEntity> {
  NewsResponseModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseModelFromJson(json);

  @override
  NewsEntity mapToEntity() {
    return NewsEntity(
      author: author ?? '',
      title: title ?? '',
      description: description ?? '',
      url: url ?? '',
      urlToImage: urlToImage ?? '',
      publishedAt: publishedAt ?? DateTime.now(),
      content: content ?? '',
    );
  }
}
