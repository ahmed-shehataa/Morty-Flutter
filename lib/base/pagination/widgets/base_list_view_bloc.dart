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

class BaseListViewBloc<T extends BasePagingModel> extends StatefulWidget {
  final BasePagingSource pagingSource;
  final Widget Function(BasePagingModel) item;
  final Widget loadingWidget;
  final ScrollController scrollController;

   BaseListViewBloc({
    required this.item,
    required this.pagingSource,
    this.loadingWidget = const Center(child: CircularProgressIndicator()),
    super.key,
    scrollController
  }) : scrollController =  ScrollController();

  @override
  State<BaseListViewBloc> createState() => _BaseListViewState();
}

class _BaseListViewState<T extends BasePagingModel>
    extends State<BaseListViewBloc> {
  late BasePagingBloc basePagingBloc;

  Widget _errorWidget(BasePagingState state) {
    return BaseErrorWidget(() {
      _loadNextPageEvent();
    }, state.errorMessage);
  }

  Widget _footerWidget(BasePagingState state) {
    if (state.pagingState == PagingState.loadingNextPage) {
      return widget.loadingWidget;
    } else if (state.pagingState == PagingState.failureAtNext) {
      return _errorWidget(state);
    } else {
      return Container();
    }
  }

  Widget _bodyWidget(BasePagingState state) {
    if (state.pagingState == PagingState.loadingFirstPage) {
      return widget.loadingWidget;
    } else if (state.pagingState == PagingState.failureAtFirst) {
      return Center(child: _errorWidget(state));
    } else if (state.list.isEmpty) {
      return const Center(child: BaseEmptyWidget());
    } else {
      return ListView.builder(
        controller: widget.scrollController,
        itemCount: state.list.length + 1,
        itemBuilder: (context, index) {
          if (index != state.list.length) {
            return widget.item(state.list[index]);
          } else {
            return _footerWidget(state);
          }
        },
      );
    }
  }

  _onRefresh() async {
    basePagingBloc.add(RefreshEvent());
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  void initState() {
    super.initState();
    basePagingBloc = BasePagingBloc(basePagingSource: widget.pagingSource);
    _loadNextPageEvent();
    widget.scrollController.addListener(
      () {
        if (widget.scrollController.hasClients &&
            widget.scrollController.position.pixels ==
                widget.scrollController.position.maxScrollExtent &&
            widget.scrollController.position.atEdge) {
          _loadNextPageEvent();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasePagingBloc, BasePagingState>(
        bloc: basePagingBloc,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => _onRefresh(),
            child: _bodyWidget(state),
          );
        });
  }

  @override
  void dispose() {
    //widget.scrollController.removeListener(_loadNextPage);
    widget.scrollController.dispose();
    super.dispose();
  }

  void _loadNextPageEvent() {
    basePagingBloc.add(LoadNextPageEvent());
  }
}
