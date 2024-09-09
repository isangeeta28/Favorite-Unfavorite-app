import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/bloc/favourite_state.dart';

import 'favourite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  List<int> favoriteItemIds = [];

  FavoriteBloc() : super(FavoriteUpdatedState([])) {
    on<ToggleFavoriteEvent>((event, emit) {
      if (favoriteItemIds.contains(event.itemId)) {
        favoriteItemIds.remove(event.itemId);
      } else {
        favoriteItemIds.add(event.itemId);
      }
      emit(FavoriteUpdatedState(List.from(favoriteItemIds)));
    });
  }
}
