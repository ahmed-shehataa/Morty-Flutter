import 'base_paging_model.dart';

abstract class BasePagingSource<T extends BasePagingModel> {
  Future<List<T>> loadPage(int page, int size);
}
