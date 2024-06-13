import 'base_state.dart';

abstract class LoginState extends BaseState {}

class LoginInitial extends LoginState {
  @override
  bool get isLoading => false;

  @override
  bool get isLoadingComplete => false;
}

class LoginLoading extends LoginState {
  @override
  bool get isLoading => true;

  @override
  bool get isLoadingComplete => false;
}

class LoginSuccess extends LoginState {
  @override
  bool get isLoading => false;

  @override
  bool get isLoadingComplete => true;
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);

  @override
  bool get isLoading => false;

  @override
  bool get isLoadingComplete => true;
}
