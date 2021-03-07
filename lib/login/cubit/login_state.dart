part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginStateLoading extends LoginState {

  LoginStateLoading();
}

class LoginStateSuccess extends LoginState {}

class LoginStateError extends LoginState {
  final String message;

  LoginStateError({@required this.message}) : assert(message != null);
}
