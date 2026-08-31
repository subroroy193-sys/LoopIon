abstract class CpcbState {}

class CpcbInitialState extends CpcbState {}

class CpcbLoadingState extends CpcbState {}

class CpcbLoadedState extends CpcbState {
  CpcbLoadedState({required this.targetValue, required this.totalSales});

  final double targetValue;
  final double totalSales;
}

class CpcbFailureState extends CpcbState {
  CpcbFailureState(this.message);

  final String message;
}
