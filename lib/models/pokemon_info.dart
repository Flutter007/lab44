class PokemonInfo {
  final String image;
  final String name;
  final String type;
  final int height;
  final int weight;
  final int baseExperience;

  PokemonInfo({
    required this.image,
    required this.name,
    required this.type,
    required this.height,
    required this.weight,
    required this.baseExperience,
  });
  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    return PokemonInfo(
      image: json['sprites']['front_default'],
      name: json['name'],
      type: json['types'][0]['type']['name'],
      height: json['height'],
      weight: json['weight'],
      baseExperience: json['base_experience'],
    );
  }
}
