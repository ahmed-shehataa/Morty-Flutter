import 'package:morty_flutter/morty/data/model/morty_data_model.dart';

import 'morty_remote_data_source.dart';

class MortyRemoteDataSourceImpl implements MortyRemoteDataSource {
  @override
  Future<List<MortyDataModel>> getMortyList(int page, int pageSize) {
    return Future.delayed(
        const Duration(seconds: 2),
        () => List.generate(
            pageSize,
            (index) => MortyDataModel(
                id: index,
                status: "page $page || index $index",
                image:
                    "https://rickandmortyapi.com/api/character/avatar/$index.jpeg")));
  }
}
