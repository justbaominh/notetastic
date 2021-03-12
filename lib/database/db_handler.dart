import 'package:dio/dio.dart';

class DbHandler {
	final _dio = Dio(BaseOptions(baseUrl: "http://localhost:8082/"));

	Future<List> getNotes() async {
		final response = await _dio.get("");
		return response.data;
	}
}