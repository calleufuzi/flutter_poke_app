import 'package:flutter/material.dart';
import 'package:poke_app/screens/loading_screen.dart';
import 'package:poke_app/states/pokemon_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonState>(
      create: (context) => PokemonState(),
      child: MaterialApp(
        title: 'PokeApp',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoadingScreen(),
      ),
    );
  }
}
