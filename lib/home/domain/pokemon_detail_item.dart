class PokemonDetailItem {
  final String name;
  final String frontProfileImage;
  final String backProfileImage;
  final TypeItem type;
  final double height;
  final int weight;

  PokemonDetailItem(
      {required this.name,
      required this.frontProfileImage,
      required this.backProfileImage,
      required this.type,
      required this.height,
      required this.weight});

  factory PokemonDetailItem.fromJson(Map<String, dynamic> json) {
    return PokemonDetailItem(
      name: json['name'],
      frontProfileImage: json['sprites']['front_default'],
      backProfileImage: json['sprites']['back_default'],
      type: TypeItem.fromJson(json['types'][0]["type"]),
      height: (json['height'] as int) / 10,
      weight: json['weight'],
    );
  }
}

class TypeItem {
  String name;
  String url;

  TypeItem({
    required this.name,
    required this.url,
  });

  factory TypeItem.fromJson(Map<String, dynamic> json) {
    return TypeItem(
      name: json['name'],
      url: json['url'],
    );
  }
}
