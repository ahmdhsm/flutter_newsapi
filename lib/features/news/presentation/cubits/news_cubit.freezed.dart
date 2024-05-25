// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsState {
  int get page => throw _privateConstructorUsedError;
  NewsStatus get status => throw _privateConstructorUsedError;
  List<NewsEntity> get news => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  ErrorResultModel? get errorModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {int page,
      NewsStatus status,
      List<NewsEntity> news,
      String? query,
      ErrorResultModel? errorModel});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = null,
    Object? news = null,
    Object? query = freezed,
    Object? errorModel = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NewsStatus,
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsEntity>,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      errorModel: freezed == errorModel
          ? _value.errorModel
          : errorModel // ignore: cast_nullable_to_non_nullable
              as ErrorResultModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsStateImplCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$$NewsStateImplCopyWith(
          _$NewsStateImpl value, $Res Function(_$NewsStateImpl) then) =
      __$$NewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      NewsStatus status,
      List<NewsEntity> news,
      String? query,
      ErrorResultModel? errorModel});
}

/// @nodoc
class __$$NewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsStateImpl>
    implements _$$NewsStateImplCopyWith<$Res> {
  __$$NewsStateImplCopyWithImpl(
      _$NewsStateImpl _value, $Res Function(_$NewsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? status = null,
    Object? news = null,
    Object? query = freezed,
    Object? errorModel = freezed,
  }) {
    return _then(_$NewsStateImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NewsStatus,
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NewsEntity>,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      errorModel: freezed == errorModel
          ? _value.errorModel
          : errorModel // ignore: cast_nullable_to_non_nullable
              as ErrorResultModel?,
    ));
  }
}

/// @nodoc

class _$NewsStateImpl implements _NewsState {
  const _$NewsStateImpl(
      {required this.page,
      required this.status,
      required final List<NewsEntity> news,
      this.query,
      this.errorModel})
      : _news = news;

  @override
  final int page;
  @override
  final NewsStatus status;
  final List<NewsEntity> _news;
  @override
  List<NewsEntity> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  final String? query;
  @override
  final ErrorResultModel? errorModel;

  @override
  String toString() {
    return 'NewsState(page: $page, status: $status, news: $news, query: $query, errorModel: $errorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsStateImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._news, _news) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.errorModel, errorModel) ||
                other.errorModel == errorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, status,
      const DeepCollectionEquality().hash(_news), query, errorModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      __$$NewsStateImplCopyWithImpl<_$NewsStateImpl>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {required final int page,
      required final NewsStatus status,
      required final List<NewsEntity> news,
      final String? query,
      final ErrorResultModel? errorModel}) = _$NewsStateImpl;

  @override
  int get page;
  @override
  NewsStatus get status;
  @override
  List<NewsEntity> get news;
  @override
  String? get query;
  @override
  ErrorResultModel? get errorModel;
  @override
  @JsonKey(ignore: true)
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
