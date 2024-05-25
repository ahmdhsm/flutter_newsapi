import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/features/news/data/models/news_list_response_model.dart';
import 'package:flutter_newsapi/features/news/data/repositories/news_repository_impl.dart';
import 'package:flutter_newsapi/features/news/domain/entities/news_list_entity.dart';
import 'package:flutter_newsapi/features/news/domain/usecases/get_news_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mock_response_data.dart';
import 'news_usecase_test.mocks.dart';

@GenerateMocks([NewsRepositoryImpl])
void main() {
  final mockRepository = MockNewsRepositoryImpl();

  final model = NewsListResponseModel.fromJson(mockResponseData);
  test('method should return data', () async {
    final useCase = GetNewsList(mockRepository);

    when(mockRepository.getNewsList(
      page: anyNamed('page'),
      query: anyNamed('query'),
    )).thenAnswer(
      (_) async => ApiResultModel.success(
        data: NewsListEntity(
          status: model.status ?? '',
          totalResults: model.totalResults ?? 0,
          articles: model.articles?.map((e) => e.mapToEntity()).toList() ?? [],
        ),
      ),
    );

    final tes = await useCase.call(
      NewsListParamRequest(query: '', page: 1),
    );

    tes.map(
      success: (data) {
        expect(
          data.data?.articles.length,
          10,
        );
      },
      failure: (error) {},
    );
  });
}
