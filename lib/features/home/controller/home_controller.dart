import 'package:flutter_boilerplate/features/home/state/home_state.dart';
import 'package:flutter_boilerplate/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    final repository = ref.read(homeRepositoryProvider);
    repository.getHomeData().then((data) {
      state = HomeState.ready(data);
    }).catchError((error) {
      state = HomeState.error(error.toString());
    });
    return const HomeState.loading();
  }
} 