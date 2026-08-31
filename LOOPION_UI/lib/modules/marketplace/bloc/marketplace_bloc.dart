abstract class MarketplaceEvent {}

class LoadMarketplaceEvent extends MarketplaceEvent {}

abstract class MarketplaceState {}

class MarketplaceInitialState extends MarketplaceState {}

class MarketplaceLoadedState extends MarketplaceState {
  MarketplaceLoadedState(this.count);

  final int count;
}
