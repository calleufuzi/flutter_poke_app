import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:poke_app/screens/home_screen.dart';
import 'package:poke_app/states/pokemon_state.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getPokemonData() async {
    try {
      var offset = Provider.of<PokemonState>(context, listen: false).offset;
      var limit = Provider.of<PokemonState>(context, listen: false).limit;
      var pokemons = await PokeAPI.getObjectList<Pokemon>(offset, limit);

      Provider.of<PokemonState>(context, listen: false).setPokemons(pokemons);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.cyan,
          size: 50.0,
        ),
      ),
    );
  }
}
