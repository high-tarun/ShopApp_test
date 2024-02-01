import 'package:dio/dio.dart';

class RestClient {
  static final RestClient _internal = RestClient._();
  Dio dio = Dio();
  RestClient._();
  factory RestClient() => _internal;

  Future<Response> getRequest(String url) async {
    print("GET/request - $url ");
    return dio.get(
      url,
    );
  }
  //
  // Future<Response> postRequest(String url,
  //     {Map<String, dynamic>? body, bool addAuthToken = false}) async {
  //   Map<String, dynamic> headers = {};
  //   print("POST/request - $url body - $body ");
  //   if (addAuthToken) {
  //     headers["Authorization"] = "Bearer ${ApplicationBloc().getAuthToken}";
  //   }
  //   return dio.post(
  //     url,
  //     data: body,
  //     options: Options(
  //       method: "POST",
  //       headers: headers,
  //     ),
  //   );
  // }
}
