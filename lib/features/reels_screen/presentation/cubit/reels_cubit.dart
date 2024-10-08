import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error_handler/failures.dart';
import '../../data/models/reels_model.dart';
import '../../domain/use_cases/get_reels_use_case.dart';

part 'reels_state.dart';

class ReelsCubit extends Cubit<ReelsState> {
  final GetReelsUseCase getReelsUseCase;

  ReelsCubit({required this.getReelsUseCase}) : super(ReelsInitial());

  void getReels() async {
    emit(ReelsLoadingState());
    final getReelsOrFailure = await getReelsUseCase.call();
    getReelsOrFailure.fold(
      (failure) {
        emit(ReelsErrorState(errorMessage: failure));
      },
      (reels) {
        emit(ReelsLoadedState(getReelsModel: reels));
      },
    );
  }
}
