import 'dart:convert';

import 'package:aarogyatech/shared/shared.dart';
import 'package:http/http.dart' as http;

class AppHttpService {
  Future<Responser> get(String url) async {
    try {
      final uri = Uri.tryParse(url);

      if (uri == null) {
        return Responser(isSuccess: false);
      }

      final response = await http.get(uri);

      return _responserData(response);
    } catch (e) {
      return Responser(isSuccess: false, message: e.toString());
    }
  }

  Future<Responser> post(String url, Map<String, dynamic> data) async {
    try {
      final uri = Uri.tryParse(url);

      if (uri == null) {
        return Responser(isSuccess: false);
      }

      final response = await http.post(uri, body: data);

      return _responserData(response);
    } catch (e) {
      return Responser(isSuccess: false, message: e.toString());
    }
  }

  Responser _responserData(http.Response response) {
    final data = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
      case 206:
        return Responser(
          isSuccess: true,
          message: 'Fetch Success',
          data: data,
        );

      case 400:
      case 510:
        return Responser(isSuccess: false, message: 'Fetch Success');

      case 401:
        return Responser(isSuccess: false, message: 'Fetch Success');
      case 403:
        return Responser(isSuccess: false, message: 'Fetch Success');
      case 404:
      case 500:
      case 503:
        return Responser(isSuccess: false, message: 'Fetch Success');
      default:
        return Responser(isSuccess: false, message: 'Fetch Success');
    }
  }
}
