import 'package:morty_flutter/morty/data/local/morty_local_data_source.dart';
import 'package:morty_flutter/morty/data/mapper/morty_data_model_mapper.dart';
import 'package:morty_flutter/morty/data/remote/morty_remote_data_source.dart';
import 'package:morty_flutter/morty/domain/model/morty_domain_model.dart';
import 'package:morty_flutter/morty/domain/repository/morty_repository.dart';

class MortyRepositoryImpl implements MortyRepository {
  final MortyRemoteDataSource remote;
  final MortyLocalDataSource local;

  MortyRepositoryImpl(this.remote, this.local);

  @override
  Future<List<MortyDomainModel>> getMortyList(int page, int pageSize) async {
    final localMorty = await local.getMortyList(page, pageSize);

    if (localMorty.isEmpty) {
      final remoteMorty = await remote.getMortyList(page, pageSize);
      await local.insertAll(remoteMorty);
    }
    final localMortyList = await local.getMortyList(page, pageSize);
    return localMortyList.map((e) => e.toDomainModel()).toList();
  }
}
