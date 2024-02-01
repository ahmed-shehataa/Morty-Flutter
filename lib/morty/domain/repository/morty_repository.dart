import '../model/morty_domain_model.dart';

abstract class MortyRepository {
  Future<List<MortyDomainModel>> getMortyList(int page, int pageSize);
}
