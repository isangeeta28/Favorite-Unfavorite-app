import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favourite/favourite_bloc.dart';
import '../bloc/favourite/favourite_event.dart';
import '../bloc/favourite/favourite_state.dart';
import '../model/item_model.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

   final List<Item> items = [
     Item(id: 1, name: 'Laptop', description: 'High performance laptop'),
     Item(id: 2, name: 'Smartphone', description: 'Latest Android smartphone'),
     Item(id: 3, name: 'Headphones', description: 'Noise-cancelling headphones'),
     Item(id: 4, name: 'Smartwatch', description: 'Waterproof smartwatch'),
     Item(id: 5, name: 'Camera', description: '4K DSLR camera'),
     Item(id: 6, name: 'Tablet', description: '10-inch display tablet'),
     Item(id: 7, name: 'Gaming Console', description: 'Next-gen gaming console'),
     Item(id: 8, name: 'Bluetooth Speaker', description: 'Portable Bluetooth speaker'),
     Item(id: 9, name: 'Monitor', description: '24-inch 1080p monitor'),
     Item(id: 10, name: 'Keyboard', description: 'Mechanical keyboard'),
   ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite/Unfavorite"),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          List<int> favoriteItemIds = [];
          if (state is FavoriteUpdatedState) {
            favoriteItemIds = state.favoriteItemIds;
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isFavorite = favoriteItemIds.contains(item.id);

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text(
                    item.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    item.description,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 28,
                    ),
                    onPressed: () {
                      context.read<FavoriteBloc>().add(ToggleFavoriteEvent(item.id));
                    },
                  ),
                ),
              );
            },
          );
        },
      )

    );
  }
}
