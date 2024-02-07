import 'package:flutter/cupertino.dart';
import 'package:morty_flutter/morty/data/model/morty_data_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/local/constants.dart';
import 'morty_local_data_source.dart';

class MortyLocalDataSourceImpl implements MortyLocalDataSource {
  final Database sqllite;

  MortyLocalDataSourceImpl(this.sqllite);

  @override
  Future<List<MortyDataModel>> getMortyList(int page, int pageSize) async {
    final List<Map<String, Object?>> mortyQuery = await sqllite
        .query(mortyTableName, limit: pageSize, offset: (page - 1) * pageSize);
    debugPrint("getMortyList MortyLocalDataSourceImpl");
    return mortyQuery.map((e) => MortyDataModel.fromJsonLocal(e)).toList();
  }

  @override
  Future<void> insertAll(List<MortyDataModel> list) async {
    for (var element in list) {
      await sqllite.insert(mortyTableName, element.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  @override
  Future<void> clearAll() async {
    await sqllite.rawDelete("delete from $mortyTableName");
  }
}
