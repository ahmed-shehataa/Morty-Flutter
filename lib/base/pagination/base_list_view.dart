import 'package:flutter/material.dart';
import 'package:morty_flutter/base/pagination/base_paging_model.dart';
import 'package:morty_flutter/base/pagination/base_paging_source.dart';

/// TODO
/// handle exceptions
/// handle loading
/// make it more generic
const _firstPageNumber = 1;

enum PagingState {
  idle,
  loadingFirstPage,
  loadingNextPage,
  failureAtFirst,
  failureAtNext,
  reachedLastPage
}

class BaseListView<T extends BasePagingModel> extends StatefulWidget {
  final BasePagingSource pagingSource;
  final Widget Function(BasePagingModel) item;

  const BaseListView(
      {super.key, required this.pagingSource, required this.item});

  @override
  State<BaseListView> createState() => _BaseListViewState();
}

class _BaseListViewState<T extends BasePagingModel>
    extends State<BaseListView> {
  final ScrollController _scrollController = ScrollController();

  final List<BasePagingModel> _list = List.empty(growable: true);

  final Widget _loadingWidget =
      const Center(child: CircularProgressIndicator());

  final Widget _errorWidget =
      const Text("Error Loading first page, retry again!");

  Widget _bodyWidget() {
    if (_pagingState == PagingState.loadingFirstPage) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_pagingState == PagingState.failureAtFirst) {
      return const Text("Error Loading first page, retry again!");
    } else {
      return ListView.builder(
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return widget.item(_list[index]);
          /*if (_pagingState == PagingState.loadingNextPage) {
            const CircularProgressIndicator();
          } else if (_pagingState == PagingState.failureAtNext) {
            const Text("Error Loading next page, retry again!");
          }*/
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
    if (_pagingState == PagingState.loadingFirstPage &&
        _pagingState == PagingState.loadingNextPage &&
        _pagingState == PagingState.reachedLastPage) {
      return;
    }

    // continue loading next page
    if (_pagingState == PagingState.idle) {
      _currentPage++;
    }

    setState(() {
      if (_currentPage == _firstPageNumber) {
        _pagingState = PagingState.loadingFirstPage;
      } else {
        _pagingState = PagingState.loadingNextPage;
      }
    });

    var result = await widget.pagingSource.loadPage(_currentPage, 20);
    _list.addAll(result);

    setState(() {
      if (result.isEmpty || result.length < 20) {
        _pagingState = PagingState.reachedLastPage;
      } else {
        _pagingState = PagingState.idle;
      }
    });
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
