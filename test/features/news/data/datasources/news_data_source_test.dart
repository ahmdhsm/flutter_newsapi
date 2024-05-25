import 'package:dio/dio.dart';
import 'package:flutter_newsapi/core/dio/base_dio.dart';
import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/core/models/error_result_model.dart';
import 'package:flutter_newsapi/features/news/data/datasources/news_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mock_response_data.dart';
import 'news_data_source_test.mocks.dart';

@GenerateMocks([BaseDio])
void main() {
  final mockBaseDio = MockBaseDio();

  test('method should return data based on response', () async {
    final dataSource = NewsDataSource(
      dio: mockBaseDio,
    );

    when(mockBaseDio.get(
      url: anyNamed('url'),
      param: anyNamed('param'),
    )).thenAnswer(
      (_) async => ApiResultModel.success(
        data: Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: mockResponseData,
        ),
      ),
    );

    final tes = await dataSource.getNewsList(
      query: 'android',
      page: 1,
    );

    tes.map(
      success: (data) {
        expect(
          data.data?.articles?.length,
          10,
        );
      },
      failure: (error) {},
    );
  });

  test('method should return error code 429', () async {
    final dataSource = NewsDataSource(
      dio: mockBaseDio,
    );

    when(mockBaseDio.get(
      url: anyNamed('url'),
      param: anyNamed('param'),
    )).thenAnswer(
      (_) async => const ApiResultModel.failure(
        errorResultEntity: ErrorResultModel(
          message: '',
          statusCode: 429,
        ),
      ),
    );

    final tes = await dataSource.getNewsList(
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
