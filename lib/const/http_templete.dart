import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wings_dating_app/helpers/helpers.dart';
import 'error_handling_template.dart';

class HttpTemplate {
  final String baseUrl;
  final Map<String, String> defaultHeaders;
  final Duration timeout;

  HttpTemplate({
    String? baseUrl,
    this.defaultHeaders = const {'Content-Type': 'application/json'},
    this.timeout = const Duration(seconds: 10),
  }) : baseUrl = baseUrl ??
            (
                // Platform.isAndroid ?
                "http://192.168.1.4:3000"
            //  :
            //  "http://localhost:3000"
            );

  Future<Map<String, dynamic>> get(String endpoint) async {
    logger.i('GET request to $baseUrl$endpoint');
    return _makeRequest('GET', endpoint);
  }

  Future<Map<String, dynamic>> post(String endpoint,
      {Map<String, dynamic>? body}) async {
    logger.i('POST request to $baseUrl$endpoint with body: $body');
    return _makeRequest('POST', endpoint, body: body);
  }

  Future<Map<String, dynamic>> put(String endpoint,
      {Map<String, dynamic>? body}) async {
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
          response =
              await http.get(url, headers: defaultHeaders).timeout(timeout);
          break;
        case 'POST':
          logger.i(
              'HTTP POST $url headers=$defaultHeaders body=${jsonEncode(body)}');
          response = await http
              .post(url, headers: defaultHeaders, body: jsonEncode(body))
              .timeout(timeout);
          break;
        case 'PUT':
          logger.i(
              'HTTP PUT $url headers=$defaultHeaders body=${jsonEncode(body)}');
          response = await http
              .put(url, headers: defaultHeaders, body: jsonEncode(body))
              .timeout(timeout);
          break;
        case 'DELETE':
          logger.i('HTTP DELETE $url headers=$defaultHeaders');
          response =
              await http.delete(url, headers: defaultHeaders).timeout(timeout);
          break;
        default:
          throw Exception('Unsupported HTTP method');
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final bodyText = response.body;
        if (bodyText.trim().isEmpty) {
          logger.i('Response(${response.statusCode}): <empty>');
          return {
            'status': 'success',
            'code': response.statusCode,
            'data': null
          };
        }
        logger.i('Response(${response.statusCode}): $bodyText');
        return {
          'status': 'success',
          'code': response.statusCode,
          'data': jsonDecode(bodyText)
        };
      } else {
        logger.w(
            'HTTP ${response.statusCode} error for $method $url. Body=${response.body}');
        return ErrorHandlingTemplate.handleHttpError(response);
      }
    } on http.ClientException catch (e) {
      logger.e('HTTP ClientException for $method $url: $e');
      return ErrorHandlingTemplate.handleClientException(e);
    } catch (e) {
      logger.e('HTTP Exception for $method $url: $e');
      return ErrorHandlingTemplate.handleGenericException(e);
    }
  }
}
