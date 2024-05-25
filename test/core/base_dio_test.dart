import 'package:dio/dio.dart';
import 'package:flutter_newsapi/core/dio/base_dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'base_dio_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  final mockDio = MockDio();

  test('Should return success data', () async {
    final baseDio = BaseDio(mockDio);

    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: {},
      ),
    );

    final test = await baseDio.get(
      url: '',
    );

    test.map(
      success: (data) {
        expect(
          data.data.data,
          {},
        );

        expect(
          data.data.statusCode,
          200,
        );
      },
      failure: (error) {},
    );
  });

  test('Should return error data', () async {
    final baseDio = BaseDio(mockDio);

    when(mockDio.get(any)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(),
        statusCode: 429,
        data: {},
      ),
    );

    final test = await baseDio.get(
      url: '',
    );

    test.map(
      success: (data) {},
      failure: (error) {
        expect(
          error.errorResultEntity.statusCode,
          429,
        );
      },
    );
  });

  test('Should return bad response', () async {
    final baseDio = BaseDio(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.badResponse(
        requestOptions: RequestOptions(),
        statusCode: 400,
        response: Response(requestOptions: RequestOptions()),
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.map(
      success: (data) {},
      failure: (error) {
        expect(
          error.errorResultEntity.message,
          'Bad response',
        );
      },
    );
  });

  test('Should return receive time out', () async {
    final baseDio = BaseDio(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.receiveTimeout(
        requestOptions: RequestOptions(),
        timeout: const Duration(seconds: 1),
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.map(
      success: (data) {},
      failure: (error) {
        expect(
          error.errorResultEntity.message,
          'Receive time out',
        );
      },
    );
  });

  test('Should return send time out', () async {
    final baseDio = BaseDio(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.connectionTimeout(
        requestOptions: RequestOptions(),
        timeout: const Duration(seconds: 1),
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.map(
      success: (data) {},
      failure: (error) {
        expect(
          error.errorResultEntity.message,
          'Connection time out',
        );
      },
    );
  });

  test('Should return send time out', () async {
    final baseDio = BaseDio(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.sendTimeout(
        requestOptions: RequestOptions(),
        timeout: const Duration(seconds: 1),
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.map(
      success: (data) {},
      failure: (error) {
        expect(
          error.errorResultEntity.message,
          'Send time out',
        );
      },
    );
  });

  test('Should return connection error', () async {
    final baseDio = BaseDio(mockDio);

    when(mockDio.get(any)).thenThrow(
      DioException.connectionError(
        requestOptions: RequestOptions(),
        reason: '',
      ),
    );

    final tes = await baseDio.get(
      url: '',
    );

    tes.map(
      success: (data) {},
      failure: (error) {
        expect(
          error.errorResultEntity.message,
          'Connection error',
        );
      },
    );
  });
}
