part of 'news_cubit.dart';

enum NewsStatus { initial, loading, success, failure }

extension NewsStatusExtension on NewsStatus {
  bool get isInitial => this == NewsStatus.initial;
  bool get isLoading => this == NewsStatus.loading;
  bool get isSuccess => this == NewsStatus.success;
  bool get isFailure => this == NewsStatus.failure;
}

@Freezed(equal: true)
class NewsState with _$NewsState {
  const factory NewsState({
    required int page,
    required NewsStatus status,
    required List<NewsEntity> news,
    String? query,
    ErrorResultModel? errorModel,
  }) = _NewsState;
}
