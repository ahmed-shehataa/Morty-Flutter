import '../model/morty_data_model.dart';

abstract class MortyLocalDataSource {
  Future<List<MortyDataModel>> getMortyList(int page, int pageSize);
  Future<void> insertAll(List<MortyDataModel> list);
}
