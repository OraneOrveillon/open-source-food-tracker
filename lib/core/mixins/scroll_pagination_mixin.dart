import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

mixin ScrollPaginationMixin<T> {
  static const int _numberOfItemsPerRequest = 20;
  int _itemsOffset = 0;

  List<T> _nextItems = [];
  late final Function(int, int) getLastItems;

  final PagingController<int, T> pagingController =
      PagingController(firstPageKey: 0);

  Future<void> initPagination(
      Future<List<T>> Function(int, int) getLastItems) async {
    this.getLastItems = getLastItems;
    pagingController.addPageRequestListener((pageKey) async {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      _nextItems = await getLastItems(_numberOfItemsPerRequest, _itemsOffset);
      _itemsOffset += _numberOfItemsPerRequest;

      final isLastPage = _nextItems.length < _numberOfItemsPerRequest;
      if (isLastPage) {
        pagingController.appendLastPage(_nextItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(_nextItems, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  void addItemInList(T item) {
    pagingController.value.itemList?.insert(0, item);
    _fetchPage(0);
  }

  void updateItemInList(T item, int index) {
    pagingController.value.itemList?[index] = item;
    _fetchPage(0);
  }

  void deleteItemInList(int index) {
    pagingController.value.itemList?.removeAt(index);
    _fetchPage(0);
  }
}
