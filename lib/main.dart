import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/views/home_page.dart';

import 'bloc/favourite/favourite_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => FavoriteBloc(),
          child: MaterialApp(
            title: 'Flutter Bloc',
            home: HomePage(),
          )
      ),
    );
  }
}

