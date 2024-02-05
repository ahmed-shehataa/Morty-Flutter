import 'package:dio/dio.dart';
import 'package:morty_flutter/core/network/constants/api_constants.dart';
import 'package:morty_flutter/morty/data/model/morty_data_model.dart';

import '../response/morty_response.dart';

class MortyService {
  final Dio _dio;

  MortyService(this._dio);

  Future<List<MortyDataModel>> getMortyList(int page, int pageSize) async {
    Response response =
        await _dio.get(APIConstants.character, queryParameters: {
      APIConstants.page: page,
    });
    MortyResponse mortyResponse = MortyResponse.fromJson(response.data);
    return mortyResponse.mortyList ?? List.empty();
  }
}
