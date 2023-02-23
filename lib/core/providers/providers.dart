import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobii_test/mobii_list/data/mobii_list_service.dart';
import 'package:mobii_test/mobii_list/domain/repository/mobii_list_repository.dart';
import 'package:mobii_test/mobii_list/domain/repository/mobii_list_repository_impl.dart';

final getIt = GetIt.instance;

void setupProviders() {
  final _dio = Dio();
  getIt
    ..registerSingleton<MobiiListApiService>(
      MobiiListApiService(_dio),
    )
    ..registerLazySingleton<MobiiListRepository>(MobiiListRepositoryImpl.new);
}
