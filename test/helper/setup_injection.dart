import 'package:flutter_newsapi/features/news/data/repositories/news_repository_impl.dart';
import 'package:get_it/get_it.dart';

import '../features/news/domain/usecase/news_usecase_test.mocks.dart';

final getIt = GetIt.instance;

void setupDependencyInjection() {
  GetIt.instance
      .registerSingleton<NewsRepositoryImpl>(MockNewsRepositoryImpl());
}
