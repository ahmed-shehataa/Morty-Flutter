import 'package:morty_flutter/morty/data/mapper/morty_data_model_mapper.dart';
import 'package:morty_flutter/morty/data/remote/morty_remote_data_source.dart';
import 'package:morty_flutter/morty/domain/model/morty_domain_model.dart';
import 'package:morty_flutter/morty/domain/repository/morty_repository.dart';

class MortyRepositoryImpl implements MortyRepository {
  final MortyRemoteDataSource remoteDataSource;

  MortyRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MortyDomainModel>> getMortyList(int page, int pageSize) {
    return remoteDataSource.getMortyList(page, pageSize).then((value) {
      return value.map((e) => e.toDomainModel()).toList();
    });
  }
}
