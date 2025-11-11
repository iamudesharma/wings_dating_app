import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// No codegen: use a plain Provider
import 'package:wings_dating_app/const/http_templete.dart';
import 'package:wings_dating_app/helpers/logger.dart';

class EngagementRepo {
  final Ref ref;
  final HttpTemplate _http = HttpTemplate();

  EngagementRepo(this.ref);

  String get _currentUserId => FirebaseAuth.instance.currentUser!.uid;

  Future<Map<String, dynamic>> likeUser(String targetUserId) async {
    try {
      final res = await _http.post('/users/$_currentUserId/like/$targetUserId');
      return Map<String, dynamic>.from(res);
    } catch (e, st) {
      logger.e('likeUser failed: $e', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> superLikeUser(String targetUserId) async {
    try {
      final res = await _http.post('/users/$_currentUserId/superlike/$targetUserId');
      return Map<String, dynamic>.from(res);
    } catch (e, st) {
      logger.e('superLikeUser failed: $e', error: e, stackTrace: st);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> rewindLastSwipe() async {
    try {
      final res = await _http.post('/users/$_currentUserId/rewind');
      return Map<String, dynamic>.from(res);
    } catch (e, st) {
      logger.e('rewindLastSwipe failed: $e', error: e, stackTrace: st);
      rethrow;
    }
  }
}

final engagementRepoProvider = Provider<EngagementRepo>((ref) => EngagementRepo(ref));
