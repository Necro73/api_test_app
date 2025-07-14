import 'package:api_test_app/core/constants.dart';
import 'package:dio/dio.dart';

final dio = Dio();

abstract class HttpHelper {
  static Future<Object?> get(String path) async {
    Response? res;
    try {
      res = await dio.get(
        '${Constants.url}$path',
      );
      return res.data;
    } on DioException catch (error) {
      print(error.response?.data);
      rethrow;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  static Future<Object?> post(String path, {required Map<String, dynamic>? request}) async {
    Response? res;
    try {
      res = await dio.post('${Constants.url}$path', data: request);
      return res.data;
    } on DioException catch (error) {
      print(error.response?.data);
      rethrow;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  static Future<Object?> put(String path, {required Map<String, dynamic>? request}) async {
    Response? res;
    try {
      res = await dio.put('${Constants.url}$path', data: request);
      return res.data;
    } on DioException catch (error) {
      print(error.response?.data);
      rethrow;
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  static Future<Object?> delete(String path, {required Map<String, dynamic>? request}) async {
    Response? res;
    try {
      res = await dio.delete('${Constants.url}$path', data: request);
      return res.data;
    } on DioException catch (error) {
      print(error.response?.data);
      rethrow;
    } catch (error) {
      print(error);
      rethrow;
    }
  }
}
