import 'package:dio/dio.dart';
import 'package:flutter_newsapi/core/models/api_result_model.dart';
import 'package:flutter_newsapi/core/models/error_result_model.dart';
import 'package:flutter_newsapi/env/env.dart';
import 'package:injectable/injectable.dart';

@injectable
class BaseDio {
  BaseDio(this.dio);

  final Dio dio;

  final baseUrl = Env.baseUrl;

  Future<ApiResultModel<Response>> get({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    final paramArray = <String>[];
    if (param != null) {
      for (var key in param.keys) {
        paramArray.add('$key=${param[key]}');
      }
    }
    paramArray.add('apiKey=${Env.apiKey}');

    final finalUrl = '$baseUrl$url?${paramArray.join('&')}';

    try {
      final result = await dio.get(
        finalUrl,
      );

      if (result.statusCode == 200) {
        return ApiResultModel.success(data: result);
      } else {
        return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
            statusCode: result.statusCode,
            message: result.statusMessage,
          ),
        );
      }
    } on DioException catch (e) {
      String errorMessage = '';
      if (e.type == DioExceptionType.badResponse) {
        errorMessage = 'Bad response';
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection time out';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Receive time out';
      } else if (e.type == DioExceptionType.sendTimeout) {
        errorMessage = 'Send time out';
      } else if (e.type == DioExceptionType.connectionError) {
        errorMessage = 'Connection error';
      }

      return ApiResultModel.failure(
        errorResultEntity: ErrorResultModel(
          message: errorMessage,
        ),
      );
    } catch (error) {
      return ApiResultModel.failure(
        errorResultEntity: ErrorResultModel(
          message: error.runtimeType.toString(),
        ),
      );
    }
  }
}
