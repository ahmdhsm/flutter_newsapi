// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListResponseModel _$NewsListResponseModelFromJson(
        Map<String, dynamic> json) =>
    NewsListResponseModel(
      status: json['status'] as String?,
      totalResults: (json['totalResults'] as num?)?.toInt(),
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => NewsResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsListResponseModelToJson(
        NewsListResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
