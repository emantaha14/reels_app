part of 'reels_cubit.dart';

sealed class ReelsState {}

final class ReelsInitial extends ReelsState {}

final class ReelsLoadedState extends ReelsState {
  final GetReelsModel getReelsModel;

  ReelsLoadedState({required this.getReelsModel});
}

final class ReelsLoadingState extends ReelsState {}

final class ReelsErrorState extends ReelsState {
  final Failure errorMessage;

  ReelsErrorState({required this.errorMessage});
}
