import 'package:flutter/material.dart';
import 'package:lab44/helpers/request.dart';
import 'package:lab44/widgets/pokemon_info_widget.dart';

import '../models/pokemon.dart';
import '../models/pokemon_info.dart';

class PokemonInfoScreen extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonInfoScreen({super.key, required this.pokemon});

  @override
  State<PokemonInfoScreen> createState() => _PokemonInfoScreenState();
}

class _PokemonInfoScreenState extends State<PokemonInfoScreen> {
  late Future<PokemonInfo> pokemonInfo;
  @override
  void initState() {
    super.initState();
    pokemonInfo = fetchPokemonInfo();
  }

  Future<PokemonInfo> fetchPokemonInfo() async {
    final Map<String, dynamic> infoRequest = await request(widget.pokemon.url);
    return PokemonInfo.fromJson(infoRequest);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pokemonInfo,
      builder: (ctx, snapshot) {
        return PokemonInfoWidget(
          pokemonInfo: snapshot.data,
          isFetching: snapshot.connectionState == ConnectionState.waiting,
        );
      },
    );
  }
}
