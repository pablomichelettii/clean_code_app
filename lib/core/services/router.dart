import 'package:clean_code_app/core/commons/extensions/context_extension.dart';
import 'package:clean_code_app/core/commons/views/page_under_costruction.dart';
import 'package:clean_code_app/core/services/injection_container.dart';
import 'package:clean_code_app/src/auth/data/models/user_model.dart';
import 'package:clean_code_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_code_app/src/auth/presentation/views/sign_in_screen.dart';
import 'package:clean_code_app/src/auth/presentation/views/sign_up_screen.dart';
import 'package:clean_code_app/src/dashboard/presentation/views/dasboard.dart';
import 'package:clean_code_app/src/on_boarding/data/datasources/on_boarding_local_datasource.dart';
import 'package:clean_code_app/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:clean_code_app/src/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'router.main.dart';
