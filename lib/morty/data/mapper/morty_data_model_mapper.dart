import 'package:morty_flutter/morty/data/model/morty_data_model.dart';
import 'package:morty_flutter/morty/domain/model/morty_domain_model.dart';

extension MortyDataModelMapper on MortyDataModel {
  MortyDomainModel toDomainModel() {
    return MortyDomainModel(
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
