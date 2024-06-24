import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:tdd_training/core/errors/failure.dart';
import 'package:tdd_training/core/network/status_code.dart';

import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  DioConsumer(this.client) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
  }

  final Dio client;

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
        message: handleDioException(error),
        statusCode: error.response?.statusCode ?? -1,
      );
    }
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    bool formDataIsEnabled = false,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body,
      );
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
        message: handleDioException(error),
        statusCode: error.response?.statusCode ?? -1,
      );
    }
  }

  @override
  Future<Response> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await client.put(path, queryParameters: queryParameters, data: body);
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
        message: handleDioException(error),
        statusCode: error.response?.statusCode ?? -1,
      );
    }
  }

  @override
  Future<Response> delete(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (error) {
      throw ServerFailure(
        message: handleDioException(error),
        statusCode: error.response?.statusCode ?? -1,
      );
    }
  }

  String handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Error During Communication';
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            return 'Bad Request';
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            return 'Unauthorized';
          case StatusCode.notFound:
            return 'Requested Info Not Found';
          case StatusCode.conflict:
            return 'Conflict Occurred';
          case StatusCode.internalServerError:
            return 'Internal Server Error';
          default:
            return 'Error During Communication';
        }
      case DioExceptionType.cancel:
        return 'Operation Canceled';
      case DioExceptionType.unknown:
        return 'No Internet Connection';
      case DioExceptionType.badCertificate:
        return 'Bad SSL/TLS Certificate';
      case DioExceptionType.connectionError:
        return 'Connection Error';
      default:
        return 'Unexpected Error';
    }
  }
}
