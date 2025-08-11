// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flutter Boilerplate';

  @override
  String get homeTitle => 'Home';

  @override
  String get welcomeTitle => 'Welcome to Flutter Boilerplate';

  @override
  String get welcomeDescription => 'A clean Flutter project with Riverpod, Freezed, and localization support';

  @override
  String get featuresTitle => 'Features';

  @override
  String get featureRiverpod => 'Riverpod State Management';

  @override
  String get featureFreezed => 'Freezed Data Classes';

  @override
  String get featureLocalization => 'Localization Support';

  @override
  String get featureCleanArchitecture => 'Clean Architecture';

  @override
  String get errorTitle => 'Error';

  @override
  String errorMessage(String error) {
    return 'Error: $error';
  }

  @override
  String get refresh => 'Refresh';

  @override
  String get loading => 'Loading...';

  @override
  String get signIn => 'Sign In';

  @override
  String get signOut => 'Sign Out';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get invalidCredentials => 'Invalid email or password';
}
