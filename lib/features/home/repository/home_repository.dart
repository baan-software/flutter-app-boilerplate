import '../model/home_model.dart';
import 'home_repository_interface.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<HomeModel> getHomeData() async {
    await Future.delayed(const Duration(seconds: 1));
    return const HomeModel(
      id: '1',
      title: 'Welcome to Flutter Boilerplate',
      description: 'A clean Flutter project with Riverpod, Freezed, and localization support',
      isFavorite: false,
    );
  }
} 