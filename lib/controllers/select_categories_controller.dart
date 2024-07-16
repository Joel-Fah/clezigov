import 'package:get/get.dart';

import '../models/category.dart';

class InterestsController extends GetxController {
  RxList _selectedInterests = [].obs;

  RxList get selectedInterests => _selectedInterests;

  // Add interest to list
  void addToInterests(Category category) {
    _selectedInterests.add(category);
    update();
  }

  // Remove interest from list
  void removeFromInterest(Category category) {
    _selectedInterests.remove(category);
    update();
  }
}