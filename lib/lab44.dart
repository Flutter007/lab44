import 'package:flutter/material.dart';
import 'package:lab44/helpers/request.dart';
import 'package:lab44/screens/pokemon_info_screen.dart';

import 'models/pokemon.dart';

class Lab44 extends StatefulWidget {
  const Lab44({super.key});

  @override
  State<Lab44> createState() => _Lab44State();
}

class _Lab44State extends State<Lab44> {
  List<Pokemon> pokemons = [];
  @override
  void initState() {
    super.initState();
    fetchPokemon();
  }

  void fetchPokemon() async {
    try {
      final pokemonsRequest =
          await request('https://pokeapi.co/api/v2/pokemon/')
              as Map<String, dynamic>;
      final result = pokemonsRequest['results'] as List<dynamic>;

      final pokemonsData =
          result.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
      setState(() {
        pokemons = pokemonsData;
      });
    } catch (E) {
      Center(child: Text(E.toString()));
    }
  }

  void goToInfo(Pokemon pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) => PokemonInfoScreen(pokemon: pokemon)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pokemon Go!')),
      body: Center(
        child: Column(
          children: [
            Text('Pokemons'),
            Expanded(
              child: ListView.builder(
                itemCount: pokemons.length,
                itemBuilder:
                    (ctx, i) => ListTile(
                      onTap: () => goToInfo(pokemons[i]),
                      title: Text('${i + 1} ${pokemons[i].name.toUpperCase()}'),
                    ),
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
