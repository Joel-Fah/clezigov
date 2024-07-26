import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcedureDescriptionController extends GetxController {
  bool _isDescriptionExpanded = false;
  bool get isDescriptionExpanded => _isDescriptionExpanded;

  void toggleDescription() {
    _isDescriptionExpanded = !_isDescriptionExpanded;
    update();
  }
}