import 'package:morty_flutter/morty/domain/repository/morty_repository.dart';

import '../model/morty_domain_model.dart';

class GetMortyListUseCase {
  final MortyRepository _repository;

  GetMortyListUseCase(this._repository);

  Future<List<MortyDomainModel>> execute(int page, int pageSize) {
    return _repository.getMortyList(page, pageSize);
  }
}
