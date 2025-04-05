import 'package:flutter/material.dart';
import 'package:lab44/helpers/request.dart';
import 'package:lab44/screens/pokemon_info_screen.dart';
import 'package:lab44/widgets/custom_tile.dart';

import 'models/pokemon.dart';

class Lab44 extends StatefulWidget {
  const Lab44({super.key});

  @override
  State<Lab44> createState() => _Lab44State();
}

class _Lab44State extends State<Lab44> {
  List<Pokemon> pokemons = [];
  bool isLoading = true;
  String? link = '';

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
      link = pokemonsRequest['next'] as String?;
      final pokemonsData =
          result.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
      setState(() {
        pokemons = pokemonsData;
      });
      isLoading = false;
    } catch (E) {
      Center(child: Text(E.toString()));
      isLoading = false;
    }
  }

  void fetchNext() async {
    if (link == null) return;
    final nextList = await request(link!) as Map<String, dynamic>;
    final result = nextList['results'] as List<dynamic>;
    final nextInfo =
        result.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
    setState(() {
      pokemons.addAll(nextInfo);
    });
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
      body:
          !isLoading
              ? Center(
                child: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: pokemons.length,
                          separatorBuilder: (ctx, i) => Divider(),
                          itemBuilder:
                              (ctx, i) => CustomTile(
                                onTap: () => goToInfo(pokemons[i]),
                                title:
                                    '${i + 1}. ${pokemons[i].name.toUpperCase()}',
                              ),
                        ),
                      ),

                      if (link != null)
                        IconButton(
                          onPressed: fetchNext,
                          icon: Icon(Icons.next_plan_outlined, size: 40),
                        ),
                    ],
                  ),
                ),
              )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
