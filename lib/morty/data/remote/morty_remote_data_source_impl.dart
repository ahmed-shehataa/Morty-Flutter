import 'package:morty_flutter/morty/data/dio/service/morty_service.dart';
import 'package:morty_flutter/morty/data/model/morty_data_model.dart';

import 'morty_remote_data_source.dart';

class MortyRemoteDataSourceImpl implements MortyRemoteDataSource {
  final MortyService _mortyService;

  MortyRemoteDataSourceImpl(this._mortyService);

  @override
  Future<List<MortyDataModel>> getMortyList(int page, int pageSize) {
    return _mortyService.getMortyList(page, pageSize);
  }
}
