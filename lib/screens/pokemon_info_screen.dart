import 'package:flutter/material.dart';
import 'package:lab44/helpers/request.dart';

import '../models/pokemon.dart';
import '../models/pokemon_info.dart';

class PokemonInfoScreen extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonInfoScreen({super.key, required this.pokemon});

  @override
  State<PokemonInfoScreen> createState() => _PokemonInfoScreenState();
}

class _PokemonInfoScreenState extends State<PokemonInfoScreen> {
  List<PokemonInfo> pokemonInfos = [];
  @override
  void initState() {
    super.initState();
    fetchPokemonInfo();
  }

  Future<void> fetchPokemonInfo() async {
    try {
      final Map<String, dynamic> infoRequest = await request(
        widget.pokemon.url,
      );
      final result = infoRequest['abilities'] as List<dynamic>;
      final pokemonInfo =
          result.map((pokemon) => PokemonInfo.fromJson(pokemon)).toList();
      print(pokemonInfo);
      setState(() {
        pokemonInfos = pokemonInfo;
      });
    } catch (E) {
      Center(child: Text(E.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemonInfos[0].name)),
      body: Center(
        child: Column(
          children: [
            Text('Pokemon Info'),
            Image.network(pokemonInfos[0].image),
          ],
        ),
      ),
    );
  }
}
