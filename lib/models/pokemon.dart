class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(name: json['name'], url: json['url']);
  }
}
