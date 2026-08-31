abstract class TelematicsEvent {}

class LoadTelematicsEvent extends TelematicsEvent {}

abstract class TelematicsState {}

class TelematicsInitialState extends TelematicsState {}

class TelematicsLoadedState extends TelematicsState {
  TelematicsLoadedState(this.averageSoh);

  final double averageSoh;
}
