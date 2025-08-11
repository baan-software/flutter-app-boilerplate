import '../model/home_model.dart';

abstract class HomeRepository {
  Future<HomeModel> getHomeData();
} 