import 'dart:convert';

class Ninja {
  final String name;
  final String ocupacao;
  final String patenteNinja;
  final String image;
  final List<String> about;
  
  Ninja({
    required this.name,
    required this.ocupacao,
    required this.patenteNinja,
    required this.image,
    required this.about,
  });
  
  

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ocupacao': ocupacao,
      'patenteNinja': patenteNinja,
      'image': image,
      'about': about,
    };
  }

  factory Ninja.fromMap(Map<String, dynamic> map) {
    return Ninja(
      name: map['name'].toString(),
      ocupacao: map["info"]["Ocupação"] ?? "Não Informado",
      patenteNinja: map["info"]["Patente Ninja"] ?? "Não Informado",
      image: map['images'][0].toString(),
      about: List<String>.from(map['about']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ninja.fromJson(String source) => Ninja.fromMap(json.decode(source));
}
