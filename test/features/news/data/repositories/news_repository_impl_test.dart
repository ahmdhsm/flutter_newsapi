import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/core/models/error_result_model.dart';
import 'package:flutter_newsapi/features/news/data/datasources/news_data_source.dart';
import 'package:flutter_newsapi/features/news/data/models/news_list_response_model.dart';
import 'package:flutter_newsapi/features/news/data/repositories/news_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mock_response_data.dart';
import 'news_repository_impl_test.mocks.dart';

@GenerateMocks([NewsDataSource])
void main() {
  final mockDataSource = MockNewsDataSource();

  test('method should return data based on response', () async {
    final repository = NewsRepositoryImpl(
      remoteDataSource: mockDataSource,
    );

    when(mockDataSource.getNewsList(
      page: anyNamed('page'),
      query: anyNamed('query'),
    )).thenAnswer(
      (_) async => ApiResultModel.success(
        data: NewsListResponseModel.fromJson(mockResponseData),
      ),
    );

    final tes = await repository.getNewsList(
      query: 'android',
      page: 1,
    );

    tes.map(
      success: (data) {
        expect(
          data.data.articles.length,
          10,
        );
      },
      failure: (error) {},
    );
  });

  test('method should return failure', () async {
    final repository = NewsRepositoryImpl(
      remoteDataSource: mockDataSource,
    );

    when(mockDataSource.getNewsList(
      page: anyNamed('page'),
      query: anyNamed('query'),
    )).thenAnswer(
      (_) async => const ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
        statusCode: 429,
      )),
    );

    final tes = await repository.getNewsList(
      query: 'android',
      page: 1,
    );

    tes.map(
      success: (data) {},
      failure: (error) {
        expect(
          error.errorResultEntity.statusCode,
          429,
        );
      },
    );
  });
}
