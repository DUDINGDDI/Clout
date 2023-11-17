import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrl = dotenv.env['CLOUT_APP_BASE_URL']!;

class RegisterApi {
  postRequest(apiUrl, parameter) async {
    var url = Uri.parse('${baseUrl}${apiUrl}');
    print(url);
    print(json.encode(parameter));
    //////////////////////////////////////////
    http.Response response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode(parameter),
    ); // 여기에 authorization header를 넣어야 될듯?

    // print('여기까지 내려오나?');
    var statusCode = response.statusCode;
    // var headers = response.headers;
    // var body = utf8.decode(response.bodyBytes);

    // var returnVal = {statusCode, headers, body};

    // return returnVal;
    print('post 통신 실행 완료');
    print('상태코드');
    print(statusCode);
    var body = utf8.decode(response.bodyBytes);
    var returnVal = [statusCode, body];

    return returnVal;
  }

  getRequest(apiUrl, parameter) async {
    var url = Uri.parse('${baseUrl}${apiUrl}${parameter}');
    print(url);
    print(json.encode(parameter));
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    print('get 통신 실행 완료');
    print('상태코드');
    var statusCode = response.statusCode;
    print(statusCode);
    var body = utf8.decode(response.bodyBytes);
    var returnVal = [statusCode, body];

    return returnVal;
  }
}
