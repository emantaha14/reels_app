import 'package:dartz/dartz.dart';
import '../../../../core/error_handler/error_exception.dart';
import '../../../../core/error_handler/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/reels_repository.dart';
import '../data_sources/reels_data_source.dart';
import '../models/reels_model.dart';

class ReelsRepositoryImpl implements ReelsRepository {
  final GetReelsDataSource getReelsDataSource;
  final NetworkInfo networkInfo;

  ReelsRepositoryImpl(
      {required this.getReelsDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, GetReelsModel>> getReels() async {
    if (await networkInfo.isConnected) {
      try {
        final getReels = await getReelsDataSource.getReels();
        return Right(getReels);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
