import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:morty_flutter/base/pagination/base_error_widget.dart';
import 'package:morty_flutter/base/pagination/base_paging_model.dart';
import 'package:morty_flutter/base/pagination/base_paging_source.dart';
import 'package:morty_flutter/base/pagination/paging_state.dart';
import 'package:morty_flutter/core/network/util/handle_exception.dart';

import 'constants.dart';

class BaseListView<T extends BasePagingModel> extends StatefulWidget {
  final BasePagingSource pagingSource;
  final Widget Function(BasePagingModel) item;
  final Widget loadingWidget;
  final int pageSize;

  const BaseListView({
    required this.item,
    required this.pagingSource,
    this.pageSize = maxPageSize,
    this.loadingWidget = const Center(child: CircularProgressIndicator()),
    super.key,
  });

  @override
  State<BaseListView> createState() => _BaseListViewState();
}

class _BaseListViewState<T extends BasePagingModel>
    extends State<BaseListView> {
  final ScrollController _scrollController = ScrollController();

  final List<BasePagingModel> _list = List.empty(growable: true);

  var _errorMessage;

  double _minHeight() {
    return (_pagingState == PagingState.reachedLastPage) ? 0 : 80;
  }

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
    } else {
      // TODO why ?
      return ListView(
        controller: _scrollController,
        children: [
          ListView.builder(
            // TODO why ?
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return widget.item(_list[index]);
            },
          ),
          SizedBox(height: _minHeight(), child: Center(child: _footerWidget()))
        ],
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
    _scrollController.addListener(
      () {
        if (_scrollController.hasClients &&
            _scrollController.position.pixels ==
                _scrollController.position.maxScrollExtent) {
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
    _scrollController.removeListener(_loadNextPage);
    _scrollController.dispose();
    super.dispose();
  }
}
