abstract class FavoriteEvent {}

class ToggleFavoriteEvent extends FavoriteEvent {
  final int itemId;

  ToggleFavoriteEvent(this.itemId);
}