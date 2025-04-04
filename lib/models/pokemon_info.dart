class PokemonInfo {
  final String image;
  final String name;
  final String type;
  final String height;
  final String weight;

  PokemonInfo({
    required this.image,
    required this.name,
    required this.type,
    required this.height,
    required this.weight,
  });
  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    return PokemonInfo(
      image: json['sprites']['front_default'],
      name: json['name'],
      type: json['types'][0]['type']['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
