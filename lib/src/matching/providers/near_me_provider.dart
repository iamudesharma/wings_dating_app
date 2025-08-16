import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/repo/profile_repo.dart';
import 'package:wings_dating_app/src/model/user_models.dart';
import 'package:wings_dating_app/src/profile/controller/profile_controller.dart';

class NearMeState {
  final List<UserModel> users;
  final bool loading;
  final String? error;
  const NearMeState({required this.users, this.loading = false, this.error});

  NearMeState copyWith({List<UserModel>? users, bool? loading, String? error}) =>
      NearMeState(users: users ?? this.users, loading: loading ?? this.loading, error: error);
}

class NearMeController extends AutoDisposeAsyncNotifier<NearMeState> {
  @override
  Future<NearMeState> build() async {
    return _fetch();
  }

  Future<NearMeState> _fetch() async {
    try {
      final user = ref.read(ProfileController.userControllerProvider).userModel;
      if (user?.position?.geopoint == null || user!.position!.geopoint.length < 2) {
        return const NearMeState(users: [], loading: false, error: 'No location');
      }
      final repo = ref.read(profileRepoProvider);
      final resp = await repo.getUserList(page: 1, limit: 20);
      // resp.data may already be User json maps
      final users = resp.data.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e))).toList();
      return NearMeState(users: users, loading: false);
    } catch (e) {
      return NearMeState(users: const [], loading: false, error: e.toString());
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetch());
  }
}

final nearMeProvider = AutoDisposeAsyncNotifierProvider<NearMeController, NearMeState>(
  NearMeController.new,
);
