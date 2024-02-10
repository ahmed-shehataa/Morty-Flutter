import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/base/pagination/base_error_widget.dart';
import 'package:morty_flutter/base/pagination/base_paging_model.dart';
import 'package:morty_flutter/base/pagination/base_paging_source.dart';
import 'package:morty_flutter/base/pagination/paging_state.dart';
import 'package:morty_flutter/core/network/extensions/handle_exception.dart';

import 'base_empty_widget.dart';
import 'constants.dart';

class BaseListView<T extends BasePagingModel> extends StatefulWidget {
  final BasePagingSource pagingSource;
  final Widget Function(BasePagingModel) item;
  final Widget loadingWidget;
  final int pageSize;
  final ScrollController scrollController;

  const BaseListView({
    required this.item,
    required this.pagingSource,
    required this.scrollController,
    this.pageSize = maxPageSize,
    this.loadingWidget = const Center(child: CircularProgressIndicator()),
    super.key,
  });

  @override
  State<BaseListView> createState() => _BaseListViewState();
}

class _BaseListViewState<T extends BasePagingModel>
    extends State<BaseListView> {
  final List<BasePagingModel> _list = List.empty(growable: true);

  var _errorMessage;

  Widget _errorWidget() {
    return BaseErrorWidget(() {
      _loadNextPage();
    }, _errorMessage);
  }

  Widget _footerWidget() {
    if (_pagingState == PagingState.loadingNextPage) {
      return widget.loadingWidget;
    } else if (_pagingState == PagingState.failureAtNext) {
      return _errorWidget();
    } else {
      return Container();
    }
  }

  Widget _bodyWidget() {
    if (_pagingState == PagingState.loadingFirstPage) {
      return widget.loadingWidget;
    } else if (_pagingState == PagingState.failureAtFirst) {
      return Center(child: _errorWidget());
    } else if (_list.isEmpty) {
      return const Center(child: BaseEmptyWidget());
    } else {
      return ListView.builder(
        controller: widget.scrollController,
        itemCount: _list.length + 1,
        itemBuilder: (context, index) {
          if (index != _list.length) {
            return widget.item(_list[index]);
          } else {
            return _footerWidget();
          }
        },
      );
    }
  }

  _onRefresh() async {
    _list.clear();
    _currentPage = 0;
    _pagingState = PagingState.idle;
    _loadNextPage();
    return Future.delayed(const Duration(seconds: 1));
  }

  var _pagingState = PagingState.idle;
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(
      () {
        if (widget.scrollController.hasClients &&
            widget.scrollController.position.pixels ==
                widget.scrollController.position.maxScrollExtent &&
            widget.scrollController.position.atEdge) {
          _loadNextPage();
        }
      },
    );

    _loadNextPage();
  }

  void _loadNextPage() async {
    if (_pagingState == PagingState.loadingFirstPage ||
        _pagingState == PagingState.loadingNextPage ||
        _pagingState == PagingState.reachedLastPage) {
      return;
    }

    // continue loading next page
    if (_pagingState == PagingState.idle) {
      _currentPage++;
    }

    setState(() {
      if (_currentPage == firstPageNumber) {
        _pagingState = PagingState.loadingFirstPage;
      } else {
        _pagingState = PagingState.loadingNextPage;
      }
    });

    var result = await widget.pagingSource
        .loadPage(_currentPage, widget.pageSize)
        .onResult();

    result.fold(
      (error) {
        _errorMessage = error.message.tr();
        setState(() {
          if (_currentPage == firstPageNumber) {
            _pagingState = PagingState.failureAtFirst;
          } else {
            _pagingState = PagingState.failureAtNext;
          }
        });
      },
      (list) {
        _list.addAll(list);
        setState(() {
          if (list.isEmpty || list.length < widget.pageSize) {
            _pagingState = PagingState.reachedLastPage;
          } else {
            _pagingState = PagingState.idle;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _onRefresh(),
      child: _bodyWidget(),
    );
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_loadNextPage);
    widget.scrollController.dispose();
    super.dispose();
  }
}
