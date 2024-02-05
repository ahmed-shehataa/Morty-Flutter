import 'location.dart';

class MortyDataModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  MortyDataModel({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.origin = const Location(name: '', url: ''),
    this.location = const Location(name: '', url: ''),
    this.image = '',
    this.episode = const [],
    this.url = '',
    this.created = '',
  });

  factory MortyDataModel.fromJson(Map<String, dynamic> json) {
    return MortyDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: Location.fromJson(json['origin'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String,
      episode: List<String>.from(json['episode'] as List),
      url: json['url'] as String,
      created: json['created'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": episode.map((x) => x).toList(),
        "url": url,
        "created": created,
      };
}
