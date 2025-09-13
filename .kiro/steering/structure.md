# Project Structure

## Root Directory Organization

```
wings_dating_app/
├── lib/                    # Flutter application code
├── main/                   # Backend API (Node.js/Bun + TypeScript)
├── android/                # Android platform files
├── ios/                    # iOS platform files
├── web/                    # Web platform files
├── macos/                  # macOS platform files
├── windows/                # Windows platform files
├── linux/                  # Linux platform files
├── assets/                 # Static assets (images, AI models)
├── memory-bank/            # Project documentation and context
└── .kiro/                  # Kiro AI assistant configuration
```

## Flutter App Structure (`lib/`)

### Feature-First Architecture
```
lib/
├── main.dart               # App entry point
├── firebase_options.dart   # Firebase configuration
├── assets.dart            # Asset path constants
├── const/                 # App constants and utilities
├── dependency/            # Dependency injection setup
├── helpers/               # Shared utilities and helpers
├── repo/                  # Repository layer (data access)
├── routes/                # AutoRoute navigation setup
├── services/              # Business logic services
├── widgets/               # Reusable UI components
└── src/                   # Feature modules
    ├── auth/              # Authentication flows
    ├── profile/           # Profile management
    ├── users/             # User discovery and browsing
    ├── chats/             # Real-time messaging
    ├── matching/          # Matching algorithms
    ├── ai_wingman/        # AI assistant features
    ├── album/             # Photo management
    ├── notifications/     # Push notifications
    ├── model/             # Data models
    ├── provider/          # Riverpod state providers
    ├── service/           # Feature-specific services
    └── view/              # UI screens and widgets
```

## Backend Structure (`main/`)

```
main/
├── index.ts               # Server entry point
├── config/                # Configuration files
├── controllers/           # API route handlers
├── models/                # Database models (Mongoose)
├── middleware/            # Express middleware
├── utils/                 # Utility functions
├── db/                    # Database setup and migrations
├── scripts/               # Maintenance scripts
├── docs/                  # API documentation
└── admin panel/           # React admin interface
```

## Key Architectural Patterns

### State Management
- **Riverpod Providers**: Located in `lib/src/provider/` and feature-specific directories
- **Generated Code**: Use `@riverpod` annotations with `build_runner`
- **Legacy Support**: Some `ChangeNotifier` classes (e.g., `ProfileController`) for backward compatibility

### Navigation
- **AutoRoute**: Configuration in `lib/routes/app_router.dart`
- **Generated Routes**: `app_router.gr.dart` (auto-generated)
- **Guards**: `AuthGuard` for protected routes

### Data Layer
- **Repository Pattern**: `lib/repo/` contains data access logic
- **HTTP Template**: `lib/const/http_template.dart` for API calls
- **Models**: Feature-specific models with JSON serialization

### UI Organization
- **Responsive Design**: Use `ResponsiveBuilder` for cross-platform layouts
- **Material 3**: Consistent theming with `FlexColorScheme`
- **Dark Mode**: All UI designed for dark color schemes

## File Naming Conventions

- **Dart Files**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variables/Functions**: `camelCase`
- **Constants**: `SCREAMING_SNAKE_CASE`
- **Generated Files**: `*.g.dart` (auto-generated, don't edit)

## Code Generation Files
- `*.g.dart` - JSON serialization, Riverpod providers
- `*.gr.dart` - AutoRoute generated routes
- Always run `flutter packages pub run build_runner build` after changes

## Asset Organization
- **Images**: `assets/` directory
- **AI Models**: `assets/*.task` files for Flutter Gemma
- **Animations**: Lottie JSON files in `assets/`