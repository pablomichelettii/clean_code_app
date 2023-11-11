import 'package:clean_code_app/src/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:clean_code_app/src/on_boarding/data/repositories/on_boarding_repository_implementation.dart';
import 'package:clean_code_app/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:clean_code_app/src/on_boarding/domain/usecases/chechk_if_user_is_first_timer.dart';
import 'package:clean_code_app/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();

  //Feature --> OnBoarding
  //Buisiness Logic
  serviceLocator
    ..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: serviceLocator(),
        checkIfUserIsFirstTimer: serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(serviceLocator()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(serviceLocator()))
    ..registerLazySingleton<OnBoardingRepositoryImpl>(
        () => OnBoardingRepositoryImpl(serviceLocator()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
        () => OnBoardingLocalDataSourceImpl(serviceLocator()))
    ..registerLazySingleton(() => prefs);
}
