import 'package:morty_flutter/morty/data/model/morty_data_model.dart';

import 'info.dart';

class MortyResponse {
  MortyResponse({
    required this.info,
    required this.mortyList,
  });

  final Info? info;
  final List<MortyDataModel>? mortyList;

  factory MortyResponse.fromJson(Map<String, dynamic> json) {
    return MortyResponse(
      info: json["info"] == null ? null : Info.fromJson(json["info"]),
      mortyList: json["results"] == null
          ? []
          : List<MortyDataModel>.from(
              json["results"]!.map((x) => MortyDataModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": mortyList?.map((x) => x.toJson()).toList(),
      };
}
