# Flutter Boilerplate

A clean Flutter project boilerplate with Riverpod, Freezed, and localization support.

## Features

- **Riverpod**: State management with code generation
- **Freezed**: Immutable data classes with JSON serialization
- **Custom HTTP Client**: Dio-based REST API service with interceptors
- **Localization**: Multi-language support with flutter_localizations
- **Clean Architecture**: Organized folder structure with features, services, and API layers
- **Repository Pattern**: Interface segregation with repository implementations
- **Dependency Injection**: Centralized providers using Riverpod
- **Secure Storage**: Token management with flutter_secure_storage

## Architecture

The project follows Clean Architecture principles with feature-based organization:

- **Features**: Self-contained modules with controllers, repositories, and state
- **API Layer**: HTTP client abstractions and response models
- **Services**: Business logic and external integrations
- **Providers**: Centralized dependency injection
- **Shared**: Common models and utilities

## Getting Started

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Generate code (Freezed and Riverpod):
   ```bash
   make generate
   ```

3. Generate localization files:
   ```bash
   make generate-l10n
   ```

4. Run the app:
   ```bash
   make run
   ```

## Available Commands

- `make generate`: Run code generation for Freezed and Riverpod
- `make generate-l10n`: Generate localization files
- `make generate-watch`: Watch for changes and auto-generate code
- `make clean`: Clean build artifacts and generated files
- `make run`: Run the Flutter app
- `make build-android`: Build Android APK (debug)
- `make build-ios`: Build iOS app (debug)
- `make build-android-release`: Build Android APK (release)
- `make build-ios-release`: Build iOS app (release)

## Dependencies

### Main Dependencies
- `flutter_riverpod`: State management
- `freezed_annotation`: Immutable data classes
- `json_annotation`: JSON serialization
- `dio`: HTTP client with interceptors
- `flutter_secure_storage`: Secure local storage
- `shared_preferences`: Local storage
- `flutter_localizations`: Localization support

### Dev Dependencies
- `build_runner`: Code generation
- `freezed`: Freezed code generator
- `json_serializable`: JSON code generator
- `riverpod_generator`: Riverpod code generator

## Code Generation

This project uses code generation for:
- **Freezed**: Immutable data classes with copyWith, toString, equality, and JSON serialization
- **Riverpod**: Provider generation for dependency injection and state management

Run `make generate` to generate all code files.

Each feature is self-contained with its own models, state, controllers, and repositories. Dependencies are injected through Riverpod providers, making the code testable and maintainable.
