import 'package:flutter_bloc/flutter_bloc.dart';
import 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(LoadingInitial());

  void startLoading() => emit(LoadingStarted());

  void stopLoading() => emit(LoadingComplete());

  void emitError(String errorMessage) => emit(LoadingError(errorMessage));
}
