import 'package:flutter_bloc/flutter_bloc.dart';
import 'loading_cubit.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoadingCubit loadingCubit;

  LoginCubit(this.loadingCubit) : super(LoginInitial());

  Future<void> login() async {
    loadingCubit.startLoading();
    try {
      // Simulate login delay
      await Future.delayed(Duration(seconds: 2));
      throw Exception("Test exception");
      // Perform login logic
      emit(LoginSuccess());
    } catch (e) {
      loadingCubit.emitError('Failed to login. Please try again.');
    } finally {
      loadingCubit.stopLoading();
    }
  }
}
