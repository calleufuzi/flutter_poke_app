import 'package:flutter/material.dart';
import 'package:poke_app/screens/pokemon_detail.dart';
import 'package:provider/provider.dart';
import 'package:poke_app/states/pokemon_state.dart';

class PokemonList extends StatelessWidget {
  ScrollController scrollController;

  PokemonList(this.scrollController);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonState>(
      builder: (BuildContext context, pokemonData, Widget child) {
        return GridView.count(
          crossAxisCount: 2,
          controller: scrollController,
          children: List.generate(
            pokemonData.pokemons.length,
            (index) {
              final pokemon = pokemonData.pokemons[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PokemonDetail(pokemon: pokemon)));
                },
                child: Hero(
                  tag: pokemon.sprites.frontDefault,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.network(pokemon.sprites.frontDefault),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 10, left: 30, right: 30, bottom: 30),
                          child: Text(
                            pokemon.name,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
