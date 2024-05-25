import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapi/core/const/category.dart';
import 'package:flutter_newsapi/core/models/error_result_model.dart';
import 'package:flutter_newsapi/features/news/domain/entities/news_entity.dart';
import 'package:flutter_newsapi/features/news/domain/usecases/get_news_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_cubit.freezed.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(
    this.useCase,
  ) : super(
          const NewsState(
            page: 1,
            status: NewsStatus.initial,
            news: [],
          ),
        );

  final GetNewsList useCase;

  Future<void> getNews() async {
    if (state.query == '') {
      return;
    }

    emit(
      state.copyWith(status: NewsStatus.loading, errorModel: null),
    );

    final news = await useCase.call(
      NewsListParamRequest(
        query: state.query ?? defaultCategory,
        page: state.page,
      ),
    );

    news.when(
      success: (data) {
        final article = List<NewsEntity>.from(state.news);
        final newsArticle = List<NewsEntity>.from(data?.articles ?? []);
        emit(
          state.copyWith(
            status: NewsStatus.success,
            news: [...article, ...newsArticle],
            page: state.page + 1,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(errorModel: error, status: NewsStatus.failure),
        );
      },
    );
  }

  Future<void> searchNews({required String query}) async {
    emit(
      state.copyWith(
        query: query,
        page: 1,
        news: [],
      ),
    );

    await getNews();
  }

  Future<void> loadMore() async {
    await getNews();
  }

  Future<void> refresh() async {
    emit(state.copyWith(
      page: 1,
      news: [],
    ));
    await getNews();
  }
}
