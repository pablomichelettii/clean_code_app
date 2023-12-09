import 'package:clean_code_app/core/commons/views/page_under_costruction.dart';
import 'package:clean_code_app/core/services/injection_container.dart';
import 'package:clean_code_app/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:clean_code_app/src/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => serviceLocator<OnBoardingCubit>(),
          child: const OnBoardingScreen(),
        ),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderCostruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(Widget Function(BuildContext) page,
    {required RouteSettings settings,}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
