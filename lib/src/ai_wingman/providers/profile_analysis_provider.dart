import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wings_dating_app/src/model/user_models.dart';

// Provider to hold profile data for AI analysis
final profileAnalysisProvider = StateProvider<UserModel?>((ref) => null);

// Provider to control auto-analysis trigger
final autoAnalysisProvider = StateProvider<bool>((ref) => false);

// Helper function to trigger profile analysis
void triggerProfileAnalysis(WidgetRef ref, UserModel profile) {
  ref.read(profileAnalysisProvider.notifier).state = profile;
  ref.read(autoAnalysisProvider.notifier).state = true;
}

// Helper function to clear analysis state
void clearProfileAnalysis(WidgetRef ref) {
  ref.read(profileAnalysisProvider.notifier).state = null;
  ref.read(autoAnalysisProvider.notifier).state = false;
}
