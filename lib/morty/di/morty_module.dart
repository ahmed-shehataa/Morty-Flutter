import 'package:morty_flutter/base/pagination/base_paging_source.dart';
import 'package:morty_flutter/morty/data/dio/service/morty_service.dart';
import 'package:morty_flutter/morty/data/remote/morty_remote_data_source_impl.dart';
import 'package:morty_flutter/morty/data/repository/morty_repository_impl.dart';
import 'package:morty_flutter/morty/domain/use_case/get_morty_list_use_case.dart';
import 'package:morty_flutter/morty/presentation/paging/morty_list_paging.dart';

import '../../di/app_module.dart';
import '../data/remote/morty_remote_data_source.dart';
import '../domain/repository/morty_repository.dart';

mortyModule() {
  // data
  getIt.registerFactory(() => MortyService(getIt.get()));
  getIt.registerFactory<MortyRemoteDataSource>(() => MortyRemoteDataSourceImpl(getIt.get()));

  getIt.registerFactory<MortyRepository>(() => MortyRepositoryImpl(getIt.get()));

  // domain
  getIt.registerFactory(() => GetMortyListUseCase(getIt.get()));

  // ui
  getIt.registerFactory<BasePagingSource>(() => MortyPagingSource(getIt.get()));
}
