import 'package:dio/dio.dart';

class DioHttpClient {
  Dio dio = Dio();

  Future<Response<dynamic>> get({
    required String url,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    final response = await dio.get(
      url,
      options: Options(
        headers: headers,
        contentType: contentType,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> post({
    required String url,
    Map<String, dynamic>? headers,
    String? contentType,
    ResponseType? responseType,
    dynamic data,
  }) async {
    final response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: headers,
        contentType: contentType,
        responseType: responseType,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> put({
    required String url,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    final response = await dio.put(
      url,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> patch({
    required String url,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    final response = await dio.patch(
      url,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> fetch(
      {required RequestOptions requestOptions}) async {
    final response = await dio.fetch(requestOptions);
    return response;
  }

  Future<Response<dynamic>> delete({
    required String url,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    final response = await dio.delete(
      url,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response<dynamic>> download({
    required String urlPath,
    dynamic savePath,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    dynamic data,
    Options? options,
  }) async {
    final response = await dio.download(
      urlPath,
      savePath,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      data: data,
      deleteOnError: deleteOnError,
      lengthHeader: lengthHeader,
      options: options,
      queryParameters: queryParameters,
    );
    return response;
  }
}
