import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/features/news/data/models/news_list_response_model.dart';
import 'package:flutter_newsapi/features/news/domain/entities/news_list_entity.dart';
import 'package:flutter_newsapi/features/news/domain/usecases/get_news_list.dart';
import 'package:flutter_newsapi/features/news/presentation/cubits/news_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mock_response_data.dart';
import 'news_cubit_test.mocks.dart';

@GenerateMocks([GetNewsList])
void main() {
  final mockUseCase = MockGetNewsList();

  final model = NewsListResponseModel.fromJson(mockResponseData);

  test(
    'Should load new data',
    () async {
      final bloc = NewsCubit(mockUseCase);

      when(mockUseCase.call(
        any,
      )).thenAnswer(
        (_) async => ApiResultModel.success(
          data: NewsListEntity(
            status: model.status ?? '',
            totalResults: model.totalResults ?? 0,
            articles:
                model.articles?.map((e) => e.mapToEntity()).toList() ?? [],
          ),
        ),
      );

      expect(
        bloc.state.status,
        NewsStatus.initial,
      );

      await bloc.getNews();

      expect(
        bloc.state.status,
        NewsStatus.success,
      );
      expect(
        bloc.state.news.length,
        10,
      );
    },
  );

  test(
    'Should load page 2',
    () async {
      final bloc = NewsCubit(mockUseCase);

      when(mockUseCase.call(
        any,
      )).thenAnswer(
        (_) async => ApiResultModel.success(
          data: NewsListEntity(
            status: model.status ?? '',
            totalResults: model.totalResults ?? 0,
            articles:
                model.articles?.map((e) => e.mapToEntity()).toList() ?? [],
          ),
        ),
      );

      expect(
        bloc.state.status,
        NewsStatus.initial,
      );

      await bloc.getNews();

      expect(
        bloc.state.page,
        2,
      );

      await bloc.loadMore();

      expect(
        bloc.state.status,
        NewsStatus.success,
      );
      expect(
        bloc.state.news.length,
        20,
      );
    },
  );
}
