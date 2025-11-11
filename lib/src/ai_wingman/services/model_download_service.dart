import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModelDownloadService {
  final String modelUrl;
  final String modelFilename;
  final String licenseUrl;

  ModelDownloadService({
    required this.modelUrl,
    required this.modelFilename,
    required this.licenseUrl,
  });

  /// Load the token from SharedPreferences.
  Future<String?> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  /// Save the token to SharedPreferences.
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  /// Helper method to get the file path.
  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$modelFilename';
  }

  String get _modelPathPrefsKey => 'model_path_$modelFilename';

  /// Persist the resolved model file path so other layers can quickly retrieve it.
  Future<void> _persistModelPath(String path) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_modelPathPrefsKey, path);
    } catch (_) {
      // ignore
    }
  }

  /// Load a previously persisted model path (if any).
  Future<String?> loadPersistedModelPath() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final path = prefs.getString(_modelPathPrefsKey);
      if (path == null) return null;
      final file = File(path);
      if (file.existsSync()) return path; // validate existence
      return null;
    } catch (_) {
      return null;
    }
  }

  /// Checks if the model file exists and matches the remote file size.
  Future<bool> checkModelExistence(String token) async {
    try {
      final filePath = await getFilePath();
      final file = File(filePath);

      // Check remote file size
      final Map<String, String> headers = token.isNotEmpty ? {'Authorization': 'Bearer $token'} : {};
      final headResponse = await http.head(Uri.parse(modelUrl), headers: headers);

      if (headResponse.statusCode == 200) {
        final contentLengthHeader = headResponse.headers['content-length'];
        if (contentLengthHeader != null) {
          final remoteFileSize = int.parse(contentLengthHeader);
          if (file.existsSync() && await file.length() == remoteFileSize) {
            return true;
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error checking model existence: $e');
      }
    }
    return false;
  }

  /// Checks only local file existence without any network calls.
  /// Useful for deciding UI flows on mobile when offline or when auth is required.
  Future<bool> existsLocally() async {
    try {
      final filePath = await getFilePath();
      final file = File(filePath);
      return file.existsSync();
    } catch (_) {
      return false;
    }
  }

  /// Downloads the model file and tracks progress.
  Future<void> downloadModel({
    required String token,
    required Function(double) onProgress,
  }) async {
    http.StreamedResponse? response;
    IOSink? fileSink;

    try {
      final filePath = await getFilePath();
      final file = File(filePath);

      // Check if file already exists and partially downloaded
      int downloadedBytes = 0;
      if (file.existsSync()) {
        downloadedBytes = await file.length();
      }

      // Create HTTP request
      final request = http.Request('GET', Uri.parse(modelUrl));
      if (token.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      // Resume download if partially downloaded
      if (downloadedBytes > 0) {
        request.headers['Range'] = 'bytes=$downloadedBytes-';
      }

      // Send request and handle response
      response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 206) {
        final contentLength = response.contentLength ?? 0;
        final totalBytes = downloadedBytes + contentLength;
        fileSink = file.openWrite(mode: FileMode.append);

        int received = downloadedBytes;

        // Listen to the stream and write to the file
        await for (final chunk in response.stream) {
          fileSink.add(chunk);
          received += chunk.length;

          // Update progress
          onProgress(totalBytes > 0 ? received / totalBytes : 0.0);
        }

        // Persist final path after successful full download
        if (await file.exists()) {
          await _persistModelPath(filePath);
        }
      } else {
        if (kDebugMode) {
          print('Failed to download model. Status code: ${response.statusCode}');
          print('Headers: ${response.headers}');
          try {
            final errorBody = await response.stream.bytesToString();
            print('Error body: $errorBody');
          } catch (e) {
            print('Could not read error body: $e');
          }
        }
        throw Exception('Failed to download the model.');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error downloading model: $e');
      }
      rethrow;
    } finally {
      if (fileSink != null) await fileSink.close();
    }
  }

  /// Deletes the downloaded file.
  Future<void> deleteModel() async {
    try {
      final filePath = await getFilePath();
      final file = File(filePath);

      if (file.existsSync()) {
        await file.delete();
      }

      // Remove persisted path
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove(_modelPathPrefsKey);
      } catch (_) {}
    } catch (e) {
      if (kDebugMode) {
        print('Error deleting model: $e');
      }
    }
  }
}
