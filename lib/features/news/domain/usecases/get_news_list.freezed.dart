// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_news_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsListParamRequest {
  String get query => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int? get itemPerPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewsListParamRequestCopyWith<NewsListParamRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsListParamRequestCopyWith<$Res> {
  factory $NewsListParamRequestCopyWith(NewsListParamRequest value,
          $Res Function(NewsListParamRequest) then) =
      _$NewsListParamRequestCopyWithImpl<$Res, NewsListParamRequest>;
  @useResult
  $Res call({String query, int page, int? itemPerPage});
}

/// @nodoc
class _$NewsListParamRequestCopyWithImpl<$Res,
        $Val extends NewsListParamRequest>
    implements $NewsListParamRequestCopyWith<$Res> {
  _$NewsListParamRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? page = null,
    Object? itemPerPage = freezed,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      itemPerPage: freezed == itemPerPage
          ? _value.itemPerPage
          : itemPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsListParamRequestImplCopyWith<$Res>
    implements $NewsListParamRequestCopyWith<$Res> {
  factory _$$NewsListParamRequestImplCopyWith(_$NewsListParamRequestImpl value,
          $Res Function(_$NewsListParamRequestImpl) then) =
      __$$NewsListParamRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, int page, int? itemPerPage});
}

/// @nodoc
class __$$NewsListParamRequestImplCopyWithImpl<$Res>
    extends _$NewsListParamRequestCopyWithImpl<$Res, _$NewsListParamRequestImpl>
    implements _$$NewsListParamRequestImplCopyWith<$Res> {
  __$$NewsListParamRequestImplCopyWithImpl(_$NewsListParamRequestImpl _value,
      $Res Function(_$NewsListParamRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? page = null,
    Object? itemPerPage = freezed,
  }) {
    return _then(_$NewsListParamRequestImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      itemPerPage: freezed == itemPerPage
          ? _value.itemPerPage
          : itemPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$NewsListParamRequestImpl implements _NewsListParamRequest {
  _$NewsListParamRequestImpl(
      {required this.query, required this.page, this.itemPerPage});

  @override
  final String query;
  @override
  final int page;
  @override
  final int? itemPerPage;

  @override
  String toString() {
    return 'NewsListParamRequest(query: $query, page: $page, itemPerPage: $itemPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsListParamRequestImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.itemPerPage, itemPerPage) ||
                other.itemPerPage == itemPerPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, page, itemPerPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsListParamRequestImplCopyWith<_$NewsListParamRequestImpl>
      get copyWith =>
          __$$NewsListParamRequestImplCopyWithImpl<_$NewsListParamRequestImpl>(
              this, _$identity);
}

abstract class _NewsListParamRequest implements NewsListParamRequest {
  factory _NewsListParamRequest(
      {required final String query,
      required final int page,
      final int? itemPerPage}) = _$NewsListParamRequestImpl;

  @override
  String get query;
  @override
  int get page;
  @override
  int? get itemPerPage;
  @override
  @JsonKey(ignore: true)
  _$$NewsListParamRequestImplCopyWith<_$NewsListParamRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
