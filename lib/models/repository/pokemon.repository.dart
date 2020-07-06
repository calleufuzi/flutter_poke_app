import 'package:pokeapi/model/evolution/evolution-chain.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';
import 'package:pokeapi/pokeapi.dart';

class PokemonRepository {
  static Future<List<Pokemon>> getPokemons(int offset, int limit) async {
    return PokeAPI.getObjectList<Pokemon>(offset, limit);
  }

  static Future<EvolutionChain> getPokemonEvelution(int id) async {
    return PokeAPI.getObject<EvolutionChain>(id);
  }
}
