// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_newsapi/core/dio/base_dio.dart' as _i4;
import 'package:flutter_newsapi/core/injector/module.dart' as _i9;
import 'package:flutter_newsapi/features/news/data/datasources/news_data_source.dart'
    as _i5;
import 'package:flutter_newsapi/features/news/data/repositories/news_repository_impl.dart'
    as _i7;
import 'package:flutter_newsapi/features/news/domain/repositories/news_repository.dart'
    as _i6;
import 'package:flutter_newsapi/features/news/domain/usecases/get_news_list.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.Dio>(() => registerModule.dio);
    gh.factory<_i4.BaseDio>(() => _i4.BaseDio(gh<_i3.Dio>()));
    gh.factory<_i5.NewsDataSource>(
        () => _i5.NewsDataSource(dio: gh<_i4.BaseDio>()));
    gh.factory<_i6.NewsRepository>(() =>
        _i7.NewsRepositoryImpl(remoteDataSource: gh<_i5.NewsDataSource>()));
    gh.factory<_i8.GetNewsList>(
        () => _i8.GetNewsList(gh<_i6.NewsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
