import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/core/param/base_param_use_case.dart';
import 'package:flutter_newsapi/features/news/domain/entities/news_list_entity.dart';
import 'package:flutter_newsapi/features/news/domain/repositories/news_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_news_list.freezed.dart';

@injectable
class GetNewsList
    implements BaseParamsUseCase<NewsListEntity?, NewsListParamRequest> {
  GetNewsList(this.newsRepository);

  final NewsRepository newsRepository;

  @override
  Future<ApiResultModel<NewsListEntity?>> call(
    NewsListParamRequest param,
  ) {
    return newsRepository.getNewsList(
      query: param.query,
      page: param.page,
      itemPerPage: param.itemPerPage,
    );
  }
}

@freezed
class NewsListParamRequest with _$NewsListParamRequest {
  factory NewsListParamRequest({
    required String query,
    required int page,
    int? itemPerPage,
  }) = _NewsListParamRequest;
}
