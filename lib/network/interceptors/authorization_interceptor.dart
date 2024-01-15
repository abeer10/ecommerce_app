import 'package:dio/dio.dart';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-RapidAPI-Key'] =
        'd9329ded30msh2e4ed90bed55972p1162f9jsn68d0a91b20ff';
    options.headers['X-RapidAPI-Host'] = 'asos2.p.rapidapi.com';
    super.onRequest(options, handler);
  }
}
