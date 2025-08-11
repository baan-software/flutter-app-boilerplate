import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_boilerplate/features/home/model/home_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = HomeLoadingState;
  const factory HomeState.ready(HomeModel data) = HomeReadyState;
  const factory HomeState.error(String message) = HomeErrorState;
} 