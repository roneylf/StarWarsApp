import 'package:dio/dio.dart';

class ApiController {
  final String BASE_URL = "https://swapi.dev/api/";

  Dio dio = Dio();

  Future<Response> get(String url) async {
    return await dio.get(BASE_URL + url);
  }
}
