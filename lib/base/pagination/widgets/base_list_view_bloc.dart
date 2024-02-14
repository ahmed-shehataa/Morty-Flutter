import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty_flutter/base/pagination/abstracts/base_paging_source.dart';
import 'package:morty_flutter/base/pagination/bloc/base_paging_event.dart';
import 'package:morty_flutter/base/pagination/bloc/base_paging_state.dart';
import 'package:morty_flutter/base/pagination/model/base_paging_model.dart';
import 'package:morty_flutter/base/pagination/widgets/base_error_widget.dart';

import '../bloc/base_paging_bloc.dart';
import '../enums/paging_state.dart';
import 'base_empty_widget.dart';

class BaseListViewBloc<T extends BasePagingModel> extends StatelessWidget {
  final BasePagingSource pagingSource;
  final Widget Function(BasePagingModel) item;
  final Widget loadingWidget;
  final ScrollController scrollController;

  const BaseListViewBloc({
    required this.item,
    required this.pagingSource,
    required this.scrollController,
    this.loadingWidget = const Center(child: CircularProgressIndicator()),
    super.key,
  });

  Widget _errorWidget(BasePagingState state, BuildContext context) {
    return BaseErrorWidget(() {
      _loadNextPageEvent(context);
    }, state.errorMessage);
  }

  Widget _footerWidget(BasePagingState state, BuildContext context) {
    if (state.pagingState == PagingState.loadingNextPage) {
      return loadingWidget;
    } else if (state.pagingState == PagingState.failureAtNext) {
      return _errorWidget(state, context);
    } else {
      return const Placeholder();
    }
  }

  Widget _bodyWidget(BasePagingState state, BuildContext context) {
    if (state.pagingState == PagingState.loadingFirstPage) {
      return loadingWidget;
    } else if (state.pagingState == PagingState.failureAtFirst) {
      return Center(child: _errorWidget(state, context));
    } else if (state.list.isEmpty) {
      // TODO handle refresh
      return const Center(child: BaseEmptyWidget());
    } else {
      return ListView.builder(
        controller: scrollController,
        itemCount: state.list.length + 1,
        itemBuilder: (context, index) {
          if (index != state.list.length) {
            return item(state.list[index]);
          } else {
            _loadNextPageEvent(context);
            return _footerWidget(state, context);
          }
        },
      );
    }
  }

  _onRefresh(BuildContext context) async {
    context.read<BasePagingBloc>().add(RefreshEvent());
    return Future.delayed(const Duration(seconds: 1));
  }

  _loadNextPageEvent(BuildContext context) {
    context.read<BasePagingBloc>().add(LoadNextPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasePagingBloc(basePagingSource: pagingSource),
      child: BlocBuilder<BasePagingBloc, BasePagingState>(
          builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () => _onRefresh(context),
          child: _bodyWidget(state, context),
        );
      }),
    );
  }
}
