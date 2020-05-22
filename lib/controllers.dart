import 'dart:convert';
import 'dart:io';

import 'entities.dart';

const String TOKEN = 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU5MDE5Njc3OCwiaWF0IjoxNTkwMTc4Nzc4fQ.z30lVhM5nbmcGxLUpbFKrsdLaPV4y4ZOrhTCDUU3wj9tn4frZC0iu7mJCsi3_kmU_xW1z717L0XkpVKpVr-tXg';

const String HOST = '192.168.0.52';
const int PORT = 8080;

class EmployeeController {
  static const String PATH = '/api/employee';

  static Future<Object> getAll() async {
    final client = HttpClient();

    HttpClientRequest request;
    HttpClientResponse response;

    try {
      request = await client.get(HOST, PORT, PATH);
      request.headers.add(HttpHeaders.contentTypeHeader, 'application/json');
      request.headers.add(HttpHeaders.authorizationHeader, TOKEN);
      response = await request.close();
    } catch (ex) {
      print(ex);
    } finally {
      client.close();
    }

    if (response != null) {
      switch (response.statusCode) {
        case HttpStatus.ok:
          print('Everything is ok');

          final String responseBody = await response?.transform(const Utf8Decoder())?.join();

          return responseBody.isNotEmpty ? jsonDecode(responseBody) : null;
        break;
        default:
          print('Error from server: ${response?.statusCode ?? "NULL"}');

          return null;
        break;
      }
    }

    return null;
  }

  static void create(final String email, final String name, final String pass) async {
    final client = HttpClient();

    HttpClientRequest request;
    HttpClientResponse response;

    try {
      request = await client.post(HOST, PORT, PATH);
      request.headers.add(HttpHeaders.contentTypeHeader, 'application/json');
      request.headers.add(HttpHeaders.authorizationHeader, TOKEN);
      request.write(
        jsonEncode(Employee(
          email: email,
          name: name,
          address: pass
        ).toJson())
      );

      response = await request.close();
    } catch (ex) {
      print(ex);
    } finally {
      client.close();
    }

    if (response != null) {
      switch (response.statusCode) {
        case HttpStatus.ok:
          print('Everything is ok');
        break;
        default:
          print('Error from server: ${response?.statusCode ?? "NULL"}');
        break;
      }
    }
  }
}
