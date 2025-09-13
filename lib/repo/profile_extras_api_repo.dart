import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/const/http_templete.dart';
import 'package:wings_dating_app/dependency/dependencies.dart';
import 'package:wings_dating_app/helpers/logger.dart';
import 'package:wings_dating_app/src/profile/models/profile_extras.dart';

final profileExtrasApiRepoProvider = Provider<ProfileExtrasApiRepo>((ref) {
  return ProfileExtrasApiRepo(ref);
});

class ProfileExtrasApiRepo {
  final Ref ref;
  final HttpTemplate _http = HttpTemplate();
  ProfileExtrasApiRepo(this.ref);

  Future<Map<String, dynamic>?> fetch() async {
    try {
      final uid = ref.read(Dependency.firebaseAuthProvider).currentUser?.uid;
      if (uid == null) return null;
      final res = await _http.get('/users/$uid/profile-extras');
      return (res['data'] as Map<String, dynamic>?);
    } catch (e) {
      logger.e('fetch extras api error: $e');
      return null;
    }
  }

  Future<void> saveAll({
    List<PromptQA>? prompts,
    List<String>? habits,
    List<String>? values,
    SocialLinks? social,
    String? videoUrl,
    VerificationStatus? verification,
  }) async {
    try {
      final uid = ref.read(Dependency.firebaseAuthProvider).currentUser?.uid;
      if (uid == null) return;
      final payload = <String, dynamic>{};
      if (prompts != null) payload['prompts'] = prompts.map((e) => e.toJson()).toList();
      if (habits != null) payload['habits'] = habits;
      if (values != null) payload['values'] = values;
      if (social != null) payload['social'] = social.toJson();
      if (videoUrl != null) payload['videoUrl'] = videoUrl;
      if (verification != null) payload['verification'] = verification.toJson();
      await _http.put('/users/$uid/profile-extras', body: payload);
    } catch (e) {
      logger.e('save extras api error: $e');
    }
  }
}
