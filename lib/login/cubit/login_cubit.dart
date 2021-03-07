import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:login_app/repository/api_repository.dart';
import 'package:login_app/net/net.dart';
import 'package:login_app/utils/utils.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ApiRepository _apiRepository = GetIt.I<ApiRepository>();

  void login(){
    if(loginController.text.isEmailValid && passwordController.text.isPasswordValid){
      _sendRequest();
    }
    else{
      emit(LoginStateError(message: 'Invalid email or password'));
    }
  }

  Future<void> _sendRequest() async {
    emit(LoginStateLoading());
    final ApiResult result = await _apiRepository.login(
      email: loginController.text,
      password: passwordController.text,
    );
    switch (result.status) {
      case ResultStatus.success:
        emit(LoginStateSuccess());
        break;
      case ResultStatus.failure:
        if (result.error is SocketException) {
          emit(LoginStateError(
              message: 'Please check your internet connection.'));
        } else {
          emit(LoginStateError(message: 'Unknown error'));
        }
        break;
      case ResultStatus.apiError:
        emit(LoginStateError(message: '${result.data}'));
        break;
    }
  }
}
