import 'package:morty_flutter/base/pagination/base_paging_model.dart';

class MortyUIModel extends BasePagingModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  MortyUIModel({
    this.id = 0,
    this.name = '',
    this.status = '',
    this.species = '',
    this.type = '',
    this.gender = '',
    this.image = '',
    this.episode = const [],
    this.url = '',
    this.created = '',
  });

  factory MortyUIModel.fromJson(Map<String, dynamic> json) {
    return MortyUIModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      episode: List<String>.from(json['episode'] as List),
      url: json['url'] as String,
      created: json['created'] as String,
    );
  }

  @override
  int getId() {
   return id;
  }
}
