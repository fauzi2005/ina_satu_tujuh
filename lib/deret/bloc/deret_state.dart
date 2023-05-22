abstract class DeretState {}

class DeretInitial extends DeretState {}

class DeretLoading extends DeretState {}

class DeretFailed extends DeretState {}

class DeretSuccess extends DeretState {
  List<dynamic> looping;

  DeretSuccess({required this.looping});
}

class DeretFinished extends DeretState {}
