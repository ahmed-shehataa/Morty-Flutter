import 'package:morty_flutter/morty/domain/model/morty_domain_model.dart';
import 'package:morty_flutter/morty/presentation/model/morty_ui_model.dart';

extension MortyUIModelMapper on MortyDomainModel {
  MortyUIModel toUIModel() {
    return MortyUIModel(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        image: image,
        episode: episode,
        url: url,
        created: created);
  }
}
