import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:poke_app/components/pokemon_list.dart';
import 'package:poke_app/states/pokemon_state.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  fetchPokemon() async {
    var offset = Provider.of<PokemonState>(context, listen: false).offset;
    var limit = Provider.of<PokemonState>(context, listen: false).limit;
    Provider.of<PokemonState>(context, listen: false).isLoading = true;
    final pokemons = await PokeAPI.getObjectList<Pokemon>(offset, limit);
    Provider.of<PokemonState>(context, listen: false).setPokemons(pokemons);
  }

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchPokemon();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = Provider.of<PokemonState>(context).isLoading
        ? Container(
            color: Colors.white54,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: new Padding(
                padding: const EdgeInsets.all(5.0),
                child: new Center(child: new CircularProgressIndicator())),
          )
        : Container();

    return Consumer<PokemonState>(
      builder: (BuildContext context, pokemonData, Widget child) {
        return Scaffold(
          backgroundColor: Colors.cyan[200],
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan,
            child: Icon(Icons.refresh),
            onPressed: () async {
              await fetchPokemon();
            },
          ),
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 30, left: 30, right: 30, bottom: 30),
                      color: Colors.cyan[50],
                      child: PokemonList(_scrollController),
                    ),
                  ),
                ],
              ),
              Align(
                child: loadingIndicator,
                alignment: FractionalOffset.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
