import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab44/models/pokemon_info.dart';

import 'custom_tile_text.dart';

class PokemonInfoWidget extends StatelessWidget {
  final PokemonInfo? pokemonInfo;
  final bool isFetching;
  final bool error;
  const PokemonInfoWidget({
    super.key,
    required this.pokemonInfo,
    required this.isFetching,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;
    final theme = Theme.of(context);
    if (isFetching) {
      content = Center(child: CircularProgressIndicator());
    } else if (error) {
      content = Center(child: Text('Something went wrong!'));
    } else {
      final pokemon = pokemonInfo!;
      content = SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.colorScheme.tertiary, width: 3),
                color: theme.colorScheme.surface,
              ),
              child: Image.network(
                pokemon.image,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            CustomTileText(title: 'Имя :', subtitle: pokemon.name),
            CustomTileText(title: 'Тип :', subtitle: pokemon.type),
            CustomTileText(
              title: 'Рост :',
              subtitle: pokemon.height.toString(),
            ),
            CustomTileText(title: 'Вес :', subtitle: pokemon.weight.toString()),
            CustomTileText(
              title: 'Опыт :',
              subtitle: pokemon.baseExperience.toString(),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemonInfo?.name.toUpperCase() ?? 'Loading .....',
          style: GoogleFonts.bungee(),
        ),
      ),
      body: content,
    );
  }
}
