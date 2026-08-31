abstract class CpcbEvent {}

abstract class CpcbState {}

class CpcbInitialState extends CpcbState {}

class CpcbLoadedState extends CpcbState {
  CpcbLoadedState(this.targetValue);

  final double targetValue;
}

class CpcbBloc {
  CpcbState get initialState => CpcbInitialState();

  Stream<CpcbState> mapEventToState(CpcbEvent event) async* {
    yield CpcbLoadedState(0.72);
  }
}
