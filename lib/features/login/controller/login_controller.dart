import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_boilerplate/providers/repository_providers.dart';
import 'package:flutter_boilerplate/features/login/state/login_state.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() {
    return const LoginState.initial();
  }

  Future<void> login(String email, String password) async {
    state = const LoginState.loading();
    final repository = ref.read(authRepositoryProvider);
    try {
      if (await repository.login(email, password)) {
        state = const LoginState.authenticated();
      } else {
        state = const LoginState.error('Unknown Error');
      }
    } catch (error) {
      state = LoginState.error(error.toString());
    }
  }
} 