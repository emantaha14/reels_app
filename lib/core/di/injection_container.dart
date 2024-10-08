import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:reels_app_spider_tech/features/reels_screen/data/data_sources/reels_data_source.dart';
import 'package:reels_app_spider_tech/features/reels_screen/data/repositories/reels_repository_impl.dart';
import 'package:reels_app_spider_tech/features/reels_screen/domain/repositories/reels_repository.dart';
import 'package:reels_app_spider_tech/features/reels_screen/domain/use_cases/get_reels_use_case.dart';

import '../network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(
    () => GetReelsUseCase(reelsRepository: sl()),
  );
  sl.registerLazySingleton<ReelsRepository>(
    () => ReelsRepositoryImpl(getReelsDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<GetReelsDataSource>(
    () => GetReelsDataSourceImpl(),
  );
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
