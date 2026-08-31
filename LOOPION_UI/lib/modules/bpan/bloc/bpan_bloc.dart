abstract class BpanEvent {}

class GenerateBpanEvent extends BpanEvent {}

abstract class BpanState {}

class BpanInitialState extends BpanState {}

class BpanGeneratedState extends BpanState {
  BpanGeneratedState(this.batchId);

  final String batchId;
}
