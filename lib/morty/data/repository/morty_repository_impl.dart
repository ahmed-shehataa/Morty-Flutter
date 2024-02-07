import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:morty_flutter/morty/data/local/morty_local_data_source.dart';
import 'package:morty_flutter/morty/data/mapper/morty_data_model_mapper.dart';
import 'package:morty_flutter/morty/data/remote/morty_remote_data_source.dart';
import 'package:morty_flutter/morty/domain/model/morty_domain_model.dart';
import 'package:morty_flutter/morty/domain/repository/morty_repository.dart';

class MortyRepositoryImpl implements MortyRepository {
  final MortyRemoteDataSource remote;
  final MortyLocalDataSource local;
  final InternetConnectionChecker connectionChecker;

  MortyRepositoryImpl(this.remote, this.local, this.connectionChecker);

  @override
  Future<List<MortyDomainModel>> getMortyList(int page, int pageSize) async {
    bool hasInternet = await connectionChecker.hasConnection;

    if (hasInternet) {
      // clear local data when (refresh whole page or open screen for first time)
      if (page == 1) {
        await local.clearAll();
      }

      final remoteMorty = await remote.getMortyList(page, pageSize);
      await local.insertAll(remoteMorty);
    }

    final localMortyList = await local.getMortyList(page, pageSize);
    return localMortyList.map((e) => e.toDomainModel()).toList();
  }
}
