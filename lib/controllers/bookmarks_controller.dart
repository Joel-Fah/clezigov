import 'package:get/get.dart';

class BookmarksController extends GetxController {
  RxList _bookmarks = [].obs;

  List get bookmarks => _bookmarks;

  void addBookmark(bookmark) {
    _bookmarks.add(bookmark);
    update();
  }

  void removeBookmark(bookmark) {
    _bookmarks.remove(bookmark);
    update();
  }

  void clearBookmarks() {
    _bookmarks.clear();
    update();
  }
}