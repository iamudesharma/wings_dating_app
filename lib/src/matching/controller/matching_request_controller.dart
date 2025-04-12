import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wings_dating_app/src/matching/models/matching_request_model.dart';
part 'matching_request_controller.g.dart';

@riverpod
class MatchingRequestController extends _$MatchingRequestController {
  @override
  build() {
    return [];
  }

  createRequest(MatchingRequestModel matchingRequest) async {
    AsyncLoading loading = AsyncLoading();
    state = loading;
    state = AsyncData(ref.read(matchingRequestCollectionProvider).add(matchingRequest));
  }
}
