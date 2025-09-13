# Technology Stack

## Frontend
- **Framework**: Flutter 3.x with Dart SDK >=3.0.0
- **UI**: Material 3 design system with FlexColorScheme for theming
- **State Management**: Riverpod (flutter_riverpod + riverpod_annotation/codegen)
- **Navigation**: AutoRoute with generated routes and AuthGuard
- **Responsive Design**: ResponsiveBuilder for cross-platform layouts

## Backend
- **Runtime**: Bun (>=1.0.0) with TypeScript
- **Framework**: Elysia.js with Express.js
- **Database**: MongoDB with Mongoose ODM
- **Authentication**: Firebase Admin SDK + JWT

## Services & Integrations
- **Firebase**: Auth, Firestore, Storage, Analytics, Realtime Database, Messaging
- **Chat**: Stream Chat Flutter SDK
- **Location**: Geolocator with geo utilities
- **AI**: Flutter Gemma for local AI models
- **Ads**: Google Mobile Ads (Android)

## Key Dependencies
- `flutter_riverpod` - State management
- `auto_route` - Type-safe navigation
- `firebase_core` - Firebase integration
- `stream_chat_flutter` - Real-time messaging
- `cached_network_image` - Image caching and performance
- `geolocator` - Location services
- `flutter_gemma` - Local AI models

## Common Commands

### Flutter Development
```bash
# Install dependencies
flutter pub get

# Run code generation
flutter packages pub run build_runner build

# Run app (choose platform)
flutter run                    # Default platform
flutter run -d chrome         # Web
flutter run -d ios           # iOS
flutter run -d android       # Android

# Build for production
flutter build apk            # Android APK
flutter build ios           # iOS
flutter build web           # Web
```

### Backend Development
```bash
# Navigate to backend
cd main

# Install dependencies
bun install

# Development server
bun run dev
bun --watch index.ts

# Production build
bun run build

# Start production server
bun run start
```

### Admin Panel
```bash
# Navigate to admin panel
cd main/admin\ panel

# Install and run
npm install
npm start
# or
bun install
bun run start
```

## Build System
- **Flutter**: Uses `build_runner` for code generation (AutoRoute, Riverpod, JSON serialization)
- **Backend**: Bun for TypeScript compilation and execution
- **Firebase**: Firebase CLI for deployment and emulator testing