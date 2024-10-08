import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/failures.dart';
import '../../data/models/reels_model.dart';

abstract class ReelsRepository {
  Future<Either<Failure, GetReelsModel>> getReels();
}
