
abstract class LoadingState {}

class LoadingInitial extends LoadingState {}

class LoadingStarted extends LoadingState {}

class LoadingComplete extends LoadingState {}

class LoadingError extends LoadingState {
  final String errorMessage;

  LoadingError(this.errorMessage);
}
