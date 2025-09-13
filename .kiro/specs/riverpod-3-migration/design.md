# Design Document

## Overview

The Riverpod 3.0 migration involves updating the Wings Dating App from Riverpod 2.x to 3.0.0. This migration brings significant improvements including better performance, enhanced developer experience, and new syntax patterns. The migration requires updating package dependencies, refactoring existing providers, and ensuring compatibility with the new architecture.

## Architecture

### Current State Analysis

The app currently uses a mix of Riverpod patterns:
- **Modern Riverpod 2.x**: `@riverpod` annotations with code generation
- **Legacy StateNotifierProvider**: Used in chat, theme, and profile controllers
- **ChangeNotifierProvider**: Used for backward compatibility in some areas
- **Mixed Provider Types**: AutoDisposeAsyncNotifierProvider, StateNotifierProvider, etc.

### Target Architecture (Riverpod 3.0)

The migration will standardize on Riverpod 3.0 patterns:
- **Unified `@Riverpod()` annotation**: Replace all provider types with the new syntax
- **New Base Classes**: `AsyncNotifier`, `Notifier`, `StreamNotifier`
- **Improved Code Generation**: Enhanced `.g.dart` files with better performance
- **Simplified Provider Access**: New `.notifier` syntax for accessing notifiers

## Components and Interfaces

### 1. Package Dependencies Update

**Current Dependencies:**
```yaml
flutter_riverpod: ^2.6.1
riverpod_annotation: ^2.6.1
riverpod_generator: ^2.6.3
riverpod_lint: (current version)
```

**Target Dependencies:**
```yaml
flutter_riverpod: ^3.0.0
riverpod_annotation: ^3.0.0
riverpod_generator: ^3.0.0
riverpod_lint: ^3.0.0
```

### 2. Provider Migration Patterns

#### Legacy StateNotifierProvider → @Riverpod Notifier
**Before:**
```dart
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeState> {
  // implementation
}
```

**After:**
```dart
@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  ThemeState build() => ThemeState.initial();
  
  // methods
}
```

#### ChangeNotifierProvider → @Riverpod Notifier
**Before:**
```dart
final _userControllerProvider = ChangeNotifierProvider<ProfileController>((ref) {
  return ProfileController(ref: ref);
});
```

**After:**
```dart
@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  ProfileState build() => ProfileState.initial();
  
  // Convert ChangeNotifier methods to state updates
}
```

#### AutoDisposeAsyncNotifierProvider → @Riverpod AsyncNotifier
**Before:**
```dart
final swipeDeckControllerProvider = AutoDisposeAsyncNotifierProvider<SwipeDeckController, SwipeDeckState>(
  SwipeDeckController.new,
);
```

**After:**
```dart
@riverpod
class SwipeDeckController extends _$SwipeDeckController {
  @override
  Future<SwipeDeckState> build() async {
    // async initialization
  }
}
```

### 3. Code Generation Updates

#### Build Runner Configuration
- Update `build_runner` to latest compatible version
- Ensure `riverpod_generator: ^3.0.0` is in dev_dependencies
- Update build scripts to handle new generation patterns

#### Generated File Patterns
- New `.g.dart` files will use Riverpod 3.0 syntax
- Provider names will follow new conventions
- Improved type safety and performance optimizations

## Data Models

### State Management Models

#### Provider State Classes
```dart
// Theme state model
@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
    required ThemeMode mode,
    required bool isDarkMode,
  }) = _ThemeState;
}

// Profile state model  
@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserModel? userModel,
    required bool isLoading,
    String? error,
  }) = _ProfileState;
}
```

#### Migration State Tracking
```dart
// Track migration progress
@freezed
class MigrationState with _$MigrationState {
  const factory MigrationState({
    required List<String> migratedProviders,
    required List<String> pendingProviders,
    required bool isComplete,
  }) = _MigrationState;
}
```

## Error Handling

### Migration Error Patterns

1. **Compilation Errors**: Handle provider syntax mismatches
2. **Runtime Errors**: Ensure state transitions work correctly
3. **Code Generation Errors**: Fix annotation and import issues
4. **Type Safety**: Resolve generic type parameter changes

### Error Recovery Strategies

```dart
// Graceful fallback for provider access
T? safeProviderRead<T>(WidgetRef ref, ProviderBase<T> provider) {
  try {
    return ref.read(provider);
  } catch (e) {
    logger.error('Provider read failed: $e');
    return null;
  }
}
```

## Testing Strategy

### Unit Testing Updates

1. **Provider Testing**: Update test patterns for new provider syntax
2. **State Testing**: Verify state transitions work with new notifiers
3. **Integration Testing**: Ensure provider interactions remain functional
4. **Performance Testing**: Validate improved performance claims

### Test Migration Patterns

```dart
// Before (Riverpod 2.x)
testWidgets('theme provider test', (tester) async {
  final container = ProviderContainer();
  final notifier = container.read(themeProvider.notifier);
  // test logic
});

// After (Riverpod 3.0)
testWidgets('theme provider test', (tester) async {
  final container = ProviderContainer();
  final notifier = container.read(themeProvider.notifier);
  // updated test logic with new syntax
});
```

### Regression Testing

1. **Authentication Flow**: Verify login/logout still works
2. **Profile Management**: Test profile updates and data persistence
3. **Chat Functionality**: Ensure real-time messaging continues working
4. **User Discovery**: Validate filtering and pagination
5. **AI Wingman**: Test AI provider functionality

## Implementation Phases

### Phase 1: Dependency Updates
- Update pubspec.yaml with Riverpod 3.0 packages
- Resolve dependency conflicts
- Update build_runner and related tools

### Phase 2: Core Provider Migration
- Migrate theme provider
- Migrate profile controller
- Update authentication providers
- Test core functionality

### Phase 3: Feature Provider Migration
- Migrate chat providers
- Update user discovery providers
- Migrate album and photo providers
- Update AI wingman providers

### Phase 4: Testing and Validation
- Run comprehensive test suite
- Performance benchmarking
- User acceptance testing
- Documentation updates

## Performance Considerations

### Expected Improvements
- **Faster Provider Access**: Riverpod 3.0 optimizes provider lookups
- **Better Memory Management**: Improved disposal and cleanup
- **Enhanced Code Generation**: More efficient generated code
- **Reduced Bundle Size**: Optimized provider implementations

### Monitoring Points
- App startup time
- Provider rebuild frequency
- Memory usage patterns
- Code generation build times

## Migration Risks and Mitigation

### High Risk Areas
1. **ChangeNotifier Dependencies**: Complex state management logic
2. **Provider Interdependencies**: Circular or complex provider relationships
3. **Generated Code Conflicts**: Potential conflicts with existing .g.dart files
4. **Third-party Package Compatibility**: Stream Chat, Firebase integrations

### Mitigation Strategies
1. **Incremental Migration**: Migrate providers one at a time
2. **Backward Compatibility**: Maintain legacy providers during transition
3. **Comprehensive Testing**: Test each migrated provider thoroughly
4. **Rollback Plan**: Ability to revert to Riverpod 2.x if needed

## Documentation Updates

### Code Examples
- Update steering files with Riverpod 3.0 patterns
- Create migration guide for team members
- Document new provider patterns and best practices

### Team Training
- Provide examples of new syntax patterns
- Document common migration pitfalls
- Create troubleshooting guide for common issues