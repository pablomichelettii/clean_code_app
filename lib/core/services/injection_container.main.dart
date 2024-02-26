part of 'injection_container.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  await _initOnBoarding();
  await _initAuth();
  await _initCourse();
}

Future<void> _initOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();
  // await prefs.clear();
  serviceLocator
    ..registerFactory(
      () => OnBoardingCubit(
        cacheFirstTimer: serviceLocator(),
        checkIfUserIsFirstTimer: serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(serviceLocator()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(serviceLocator()))
    ..registerLazySingleton<OnBoardingRepository>(
      () => OnBoardingRepositoryImpl(serviceLocator()),
    )
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(serviceLocator()),
    )
    ..registerLazySingleton(() => prefs);
}

Future<void> _initAuth() async {
  serviceLocator
    ..registerFactory(
      () => AuthBloc(
        signIn: serviceLocator(),
        signUp: serviceLocator(),
        forgotPassword: serviceLocator(),
        updateUser: serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => SignIn(serviceLocator()))
    ..registerLazySingleton(() => SignUp(serviceLocator()))
    ..registerLazySingleton(() => ForgotPassword(serviceLocator()))
    ..registerLazySingleton(() => UpdateUser(serviceLocator()))
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        authClient: serviceLocator(),
        cloudStoreClient: serviceLocator(),
        dbClient: serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance);
}

Future<void> _initCourse() async {
  serviceLocator
    ..registerFactory(
      () => CourseCubit(
        addCourse: serviceLocator(),
        getCourses: serviceLocator(),
      ),
    )
    ..registerLazySingleton(() => AddCourse(serviceLocator()))
    ..registerLazySingleton(() => GetCourses(serviceLocator()))
    ..registerLazySingleton<CourseRepository>(
        () => CourseRepoImpl(serviceLocator()))
    ..registerLazySingleton<CourseRemoteDataSource>(
      () => CourseRemoteDataSrcImpl(
        firestore: serviceLocator(),
        storage: serviceLocator(),
        auth: serviceLocator(),
      ),
    );
}
