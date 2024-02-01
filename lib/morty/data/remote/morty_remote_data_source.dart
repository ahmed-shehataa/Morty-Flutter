import '../model/morty_data_model.dart';

abstract class MortyRemoteDataSource {
  Future<List<MortyDataModel>> getMortyList(int page, int pageSize);
}
