import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wings_dating_app/helpers/helpers.dart';
import 'error_handling_template.dart';

class HttpTemplate {
  final String baseUrl;
  final Map<String, String> defaultHeaders;
  final Duration timeout;

  HttpTemplate({
    this.baseUrl = "http://localhost:3000",
    this.defaultHeaders = const {'Content-Type': 'application/json'},
    this.timeout = const Duration(seconds: 10),
  });

  Future<Map<String, dynamic>> get(String endpoint) async {
    logger.i('GET request to $baseUrl$endpoint');
    return _makeRequest('GET', endpoint);
  }

  Future<Map<String, dynamic>> post(String endpoint, {Map<String, dynamic>? body}) async {
    logger.i('POST request to $baseUrl$endpoint with body: $body');
    return _makeRequest('POST', endpoint, body: body);
  }

  Future<Map<String, dynamic>> put(String endpoint, {Map<String, dynamic>? body}) async {
    logger.i('PUT request to $baseUrl$endpoint with body: $body');
    return _makeRequest('PUT', endpoint, body: body);
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    logger.i('DELETE request to $baseUrl$endpoint');
    return _makeRequest('DELETE', endpoint);
  }

  Future<Map<String, dynamic>> _makeRequest(
    String method,
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    try {
      late http.Response response;

      switch (method) {
        case 'GET':
          response = await http.get(url, headers: defaultHeaders).timeout(timeout);
          break;
        case 'POST':
          response = await http.post(url, headers: defaultHeaders, body: jsonEncode(body)).timeout(timeout);
          break;
        case 'PUT':
          response = await http.put(url, headers: defaultHeaders, body: jsonEncode(body)).timeout(timeout);
          break;
        case 'DELETE':
          response = await http.delete(url, headers: defaultHeaders).timeout(timeout);
          break;
        default:
          throw Exception('Unsupported HTTP method');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        logger.i('Response: ${response.body}');
        return {'status': 'success', 'code': response.statusCode, 'data': jsonDecode(response.body)};
      } else {
        return ErrorHandlingTemplate.handleHttpError(response);
      }
    } on http.ClientException catch (e) {
      return ErrorHandlingTemplate.handleClientException(e);
    } catch (e) {
      return ErrorHandlingTemplate.handleGenericException(e);
    }
  }
}
