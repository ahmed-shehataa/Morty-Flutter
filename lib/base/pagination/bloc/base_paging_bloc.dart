import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_flutter/base/pagination/abstracts/base_paging_source.dart';
import 'package:morty_flutter/core/network/extensions/handle_exception.dart';

import '../consatnts/constants.dart';
import '../enums/paging_state.dart';
import 'base_paging_event.dart';
import 'base_paging_state.dart';

class BasePagingBloc extends Bloc<BasePagingEvent, BasePagingState> {
  final BasePagingSource basePagingSource;

  BasePagingBloc({required this.basePagingSource}) : super(BasePagingState()) {
    on<LoadNextPageEvent>((event, emit) async {
      await loadNextPage(emit);
    });

    on<RefreshEvent>((event, emit) async {
      // reset ui data
      emit(BasePagingState(
        currentPage: 0,
        pagingState: PagingState.idle,
        errorMessage: null,
      ));

      // load first page
      await loadNextPage(emit);
    });
  }

  Future<void> loadNextPage(Emitter<BasePagingState> emit) async {
    if (state.pagingState == PagingState.loadingFirstPage ||
        state.pagingState == PagingState.loadingNextPage ||
        state.pagingState == PagingState.reachedLastPage) {
      return;
    }

    // continue loading next page
    if (state.pagingState == PagingState.idle) {
      emit(state.copy(currentPage: state.currentPage + 1));
    }

    if (state.currentPage == firstPageNumber) {
      emit(state.copy(pagingState: PagingState.loadingFirstPage));
    } else {
      emit(state.copy(pagingState: PagingState.loadingNextPage));
    }

    // get result
    var result = await basePagingSource
        .loadPage(state.currentPage, basePagingSource.pageSize)
        .onResult();

    // handle result (error - success)
    result.fold(
      (error) {
        emit(state.copy(errorMessage: error.message.tr()));
        if (state.currentPage == firstPageNumber) {
          emit(state.copy(pagingState: PagingState.failureAtFirst));
        } else {
          emit(state.copy(pagingState: PagingState.failureAtNext));
        }
      },
      (list) {
        emit(state.copy(list: List.from(state.list + list)));

        if (list.isEmpty || list.length < basePagingSource.pageSize) {
          emit(state.copy(pagingState: PagingState.reachedLastPage));
        } else {
          emit(state.copy(pagingState: PagingState.idle));
        }
      },
    );
  }
}
