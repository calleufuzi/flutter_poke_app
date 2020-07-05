import 'package:flutter/material.dart';
import 'package:pokeapi/model/pokemon/pokemon.dart';

class PokemonState extends ChangeNotifier {
  List<Pokemon> pokemons = [];
  int _offset = 1;
  int _limit = 10;
  bool _isLoading = false;

  void setPokemons(List<Pokemon> pokemonsList) {
    pokemons = [...pokemons, ...pokemonsList];
    offset = pokemons.length + 1;
    isLoading = false;
    notifyListeners();
  }

  get offset => _offset;
  get limit => _limit;
  get isLoading => _isLoading;

  set offset(int value) {
    _offset = value;
    notifyListeners();
  }

  set limit(int value) {
    _limit = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
