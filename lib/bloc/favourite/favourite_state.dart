abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteUpdatedState extends FavoriteState {
  final List<int> favoriteItemIds;

  FavoriteUpdatedState(this.favoriteItemIds);
}
