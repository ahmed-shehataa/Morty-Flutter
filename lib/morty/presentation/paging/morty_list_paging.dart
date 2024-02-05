import 'package:morty_flutter/base/pagination/base_paging_source.dart';
import 'package:morty_flutter/morty/domain/use_case/get_morty_list_use_case.dart';
import 'package:morty_flutter/morty/presentation/mapper/morty_ui_model_mapper.dart';
import 'package:morty_flutter/morty/presentation/model/morty_ui_model.dart';

class MortyPagingSource extends BasePagingSource<MortyUIModel> {
  final GetMortyListUseCase getMortyListUseCase;

  MortyPagingSource(this.getMortyListUseCase);

  @override
  Future<List<MortyUIModel>> loadPage(int page, int size) async {
    return getMortyListUseCase.execute(page, size).then(
      (list) {
        return list.map((e) => e.toUIModel()).toList();
      },
    );
  }
}
