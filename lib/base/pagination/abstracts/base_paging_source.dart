import '../constants/constants.dart';
import '../model/base_paging_model.dart';

abstract class BasePagingSource<T extends BasePagingModel> {
  final bool isLazy = false;
  final int pageSize = maxPageSize;

  Future<List<T>> loadPage(int page, int size);
}
