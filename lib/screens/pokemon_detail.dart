import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetail({this.pokemon});

  bodyComponent(context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width - 20,
            top: MediaQuery.of(context).size.height * 0.12,
            left: 10,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  Text("Height: ${(pokemon.height / 10).toString()} m"),
                  Text("Weight: ${(pokemon.weight / 10).toString()} kg"),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.types
                        .map(
                          (e) => FilterChip(
                            label: Text(
                              e.type.name,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor: Colors.amber,
                            onSelected: (b) {},
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: pokemon.sprites.frontDefault,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(pokemon.sprites.frontDefault),
                    ),
                  ),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        title: Text(pokemon.name),
      ),
      body: bodyComponent(context),
    );
  }
}
