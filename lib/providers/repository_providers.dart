import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import '../features/login/repository/auth_repository.dart';
import '../features/login/repository/auth_repository_impl.dart';
import '../features/home/repository/home_repository_interface.dart';
import '../features/home/repository/home_repository.dart';
import 'package:flutter_boilerplate/providers/api_providers.dart';

part 'repository_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final authApi = ref.read(authApiProvider);
  return AuthRepositoryImpl(authApi);
}

@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl();
} 