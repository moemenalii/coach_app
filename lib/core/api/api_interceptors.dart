import 'package:dio/dio.dart';
import 'package:healthystate/cache_helper.dart';
import 'package:healthystate/core/api/end_ponits.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // options.headers[ApiKey.token] =
    //     CacheHelper().getData(key: ApiKey.token) != null
    //         ? '${CacheHelper().getData(key: ApiKey.token)}'
    //         : null;
    var token = await CacheHelper().getData(key: ApiKey.token);
    options.headers['Authorization'] = token != null ? 'Bearer $token' : null;

    super.onRequest(options, handler);
  }
}
