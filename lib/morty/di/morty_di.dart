import 'package:morty_flutter/morty/data/remote/morty_remote_data_source_impl.dart';
import 'package:morty_flutter/morty/data/repository/morty_repository_impl.dart';
import 'package:morty_flutter/morty/domain/use_case/get_morty_list_use_case.dart';
import 'package:morty_flutter/morty/presentation/paging/morty_list_paging.dart';

class MortyDI {
  static MortyPagingSource getPaging() {
    var remote = MortyRemoteDataSourceImpl();
    var repo = MortyRepositoryImpl(remote);
    var useCase = GetMortyListUseCase(repo);
    return MortyPagingSource(useCase);
  }
}
