import 'package:bloc/bloc.dart';
import 'package:clean_code_app/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:clean_code_app/src/on_boarding/domain/usecases/chechk_if_user_is_first_timer.dart';
import 'package:equatable/equatable.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit(
      {required CacheFirstTimer cacheFirstTimer,
      required CheckIfUserIsFirstTimer checkIfUserIsFirstTimer})
      : _cacheFirstTimer = cacheFirstTimer,
        _checkIfUserIsFirstTimer = checkIfUserIsFirstTimer,
        super(const OnBoardingInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserIsFirstTimer _checkIfUserIsFirstTimer;

  Future<void> cacheFirstTimer() async {
    final result = await _cacheFirstTimer();

    result.fold(
      (failure) => emit(OnBoardingError(failure.errorMessage)),
      (_) => emit(const UserCached()),
    );
  }

  Future<void> checkIfUserIsFirstTimer() async {
    final result = await _checkIfUserIsFirstTimer();

    result.fold(
      (failure) => emit(const OnBoartingStatus(isFirstTimer: true)),
      (status) => emit(OnBoartingStatus(isFirstTimer: status)),
    );
  }
}
