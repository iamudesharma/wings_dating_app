import 'dart:async';
import 'package:http/http.dart' as http;

class ErrorHandlingTemplate {
  static Map<String, dynamic> handleHttpError(http.Response response) {
    return {
      'status': 'error',
      'error_type': 'HTTPError',
      'code': response.statusCode,
      'message': response.reasonPhrase,
      'details': response.body
    };
  }

  static Map<String, dynamic> handleTimeout() {
    return {
      'status': 'error',
      'error_type': 'TimeoutError',
      'message': 'The request timed out. Please try again later.'
    };
  }

  static Map<String, dynamic> handleClientException(Exception e) {
    return {
      'status': 'error',
      'error_type': 'ClientException',
      'message': e.toString()
    };
  }

  static Map<String, dynamic> handleGenericException(dynamic error) {
    return {
      'status': 'error',
      'error_type': 'Exception',
      'message': error.toString()
    };
  }
}
