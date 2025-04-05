import 'package:flutter/material.dart';
import 'package:lab44/models/pokemon_info.dart';

class PokemonInfoWidget extends StatelessWidget {
  final PokemonInfo? pokemonInfo;
  final bool isFetching;
  const PokemonInfoWidget({
    super.key,
    required this.pokemonInfo,
    required this.isFetching,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (isFetching) {
      content = Center(child: CircularProgressIndicator());
    } else if (pokemonInfo == null) {
      content = Center(child: Text('Something went wrong!'));
    } else {
      final pokemon = pokemonInfo!;
      content = Center(
        child: Column(
          children: [
            Image.network(pokemon.image, fit: BoxFit.cover, height: 200),
            Text('Имя : ${pokemon.name}'),
            Text('Тип : ${pokemon.type}'),
            Text('Рост : ${pokemon.height}'),
            Text('Вес : ${pokemon.weight}'),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonInfo?.name.toUpperCase() ?? 'Loading .....'),
      ),
      body: content,
    );
  }
}
