
import '../enums/paging_state.dart';
import '../model/base_paging_model.dart';

class BasePagingState {
  final List<BasePagingModel> list;
  final String? errorMessage;
  final PagingState pagingState;
  final int currentPage;

  BasePagingState({
    this.list = const [],
    this.errorMessage,
    this.pagingState = PagingState.idle,
    this.currentPage = 0,
  });

  BasePagingState copy({
    List<BasePagingModel>? list,
    String? errorMessage,
    PagingState? pagingState,
    int? currentPage,
  }) {
    return BasePagingState(
      list: list ?? this.list,
      errorMessage: errorMessage ?? this.errorMessage,
      pagingState: pagingState ?? this.pagingState,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
