import 'package:dio/dio.dart';

import '../cache/cache_data.dart';
import 'end_points.dart';

class ApiHelper {
  // Singleton
  static final ApiHelper _instance = ApiHelper._init();
  factory ApiHelper() => _instance;

  ApiHelper._init();

  // Dio instance with its options configured
  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  // Post Request
  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
    bool isRefresh = false,
  }) async {
    return await dio.post(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(
        headers: {
          if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
          if (isRefresh) 'refresh-token': 'Bearer ${CacheData.refreshToken}',
        },
      ),
    );
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
  }) async {
    return await dio.get(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(
        headers: {
          if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
        },
      ),
    );
  }

  Future<Response> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
  }) async {
    return await dio.put(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(
        headers: {
          if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
        },
      ),
    );
  }

  Future<Response> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    bool isFormData = true,
    bool isProtected = false,
  }) async {
    return await dio.delete(
      endPoint,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      options: Options(
        headers: {
          if (isProtected) 'Authorization': 'Bearer ${CacheData.accessToken}',
        },
      ),
    );
  }
}
