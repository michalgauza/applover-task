import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:login_app/repository/api_repository.dart';
import 'package:login_app/utils/utils.dart';
import 'package:login_app/app.dart';

const baseUrl = "https://reqres.in/api";

void setup() {
  Bloc.observer = SimpleBlocObserver();
  GetIt.I
    ..registerLazySingleton<ApiRepository>(
        () => ApiRepository(baseUrl: baseUrl));
}

void main() {
  setup();
  runApp(App());
}
