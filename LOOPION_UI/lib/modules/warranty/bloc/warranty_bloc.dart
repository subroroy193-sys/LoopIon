abstract class WarrantyEvent {}

class LoadWarrantyClaimsEvent extends WarrantyEvent {}

abstract class WarrantyState {}

class WarrantyInitialState extends WarrantyState {}

class WarrantyLoadedState extends WarrantyState {
  WarrantyLoadedState(this.claimCount);

  final int claimCount;
}
