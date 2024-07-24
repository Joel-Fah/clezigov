import 'package:get/get.dart';

import '../models/procedures/procedures.dart';

class EndorsementsController extends GetxController {
  RxList _endorsements = [].obs;

  List get endorsements => _endorsements;

  void addBookmark(Procedure endorsement) {
    _endorsements.add(endorsement);
    update();
  }

  void removeBookmark(endorsement) {
    _endorsements.remove(endorsement);
    update();
  }

  void clearBookmarks() {
    _endorsements.clear();
    update();
  }
}