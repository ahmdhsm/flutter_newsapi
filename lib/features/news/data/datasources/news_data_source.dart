import 'package:flutter_newsapi/core/const/app_url.dart';
import 'package:flutter_newsapi/core/dio/base_dio.dart';
import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/features/news/data/models/news_list_response_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewsDataSource {
  NewsDataSource({required this.dio});

  final BaseDio dio;

  Future<ApiResultModel<NewsListResponseModel?>> getNewsList({
    required String query,
    required int page,
    int? itemPerPage,
  }) async {
    try {
      final result = await dio.get(
        url: AppUrl.everything,
        param: {
          'q': query,
          'page': page,
          'sortBy': 'publishedAt',
          'language': 'en',
          'pageSize': itemPerPage ?? 10,
        },
      );
      return result.when(
        success: (response) {
          return ApiResultModel<NewsListResponseModel?>.success(
            data: NewsListResponseModel.fromJson(
              response.data as Map<String, dynamic>,
            ),
          );
        },
        failure: (error) {
          return ApiResultModel<NewsListResponseModel?>.failure(
            errorResultEntity: error,
          );
        },
      );
    } catch (exception) {
      rethrow;
    }
  }
}
