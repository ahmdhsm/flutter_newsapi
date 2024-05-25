import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/features/news/data/datasources/news_data_source.dart';
import 'package:flutter_newsapi/features/news/domain/entities/news_list_entity.dart';
import 'package:flutter_newsapi/features/news/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl({
    required this.remoteDataSource,
  });

  final NewsDataSource remoteDataSource;

  @override
  Future<ApiResultModel<NewsListEntity>> getNewsList({
    required String query,
    required int page,
    int? itemPerPage,
  }) async {
    final result = await remoteDataSource.getNewsList(
      query: query,
      page: page,
    );
    return result.when(
      success: (data) {
        return ApiResultModel.success(data: data!.mapToEntity());
      },
      failure: (error) {
        return ApiResultModel.failure(
          errorResultEntity: error,
        );
      },
    );
  }
}
