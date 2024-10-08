import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/failures.dart';
import '../../data/models/reels_model.dart';
import '../repositories/reels_repository.dart';

class GetReelsUseCase {
  final ReelsRepository reelsRepository;

  GetReelsUseCase({required this.reelsRepository});

  Future<Either<Failure, GetReelsModel>> call() async {
    return await reelsRepository.getReels();
  }
}
