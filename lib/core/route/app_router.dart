import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newsapi/features/news/presentation/pages/news_detail_page.dart';
import 'package:flutter_newsapi/features/news/presentation/pages/news_list_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          initial: true,
          page: NewsListRoute.page,
        ),
        AutoRoute(
          path: '/detail',
          page: NewsDetailRoute.page,
        ),
      ];
}
