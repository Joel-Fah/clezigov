import 'package:get/get.dart';

class NotificationsController extends GetxController {
  bool _newProceduresValue = false;
  bool _communityActivityValue = false;

  bool get newProceduresValue => _newProceduresValue;
  bool get communityActivityValue => _communityActivityValue;

  void toggleProceduresValue() {
    _newProceduresValue = !_newProceduresValue;
    update();
  }

  void toggleCommunityValue() {
    _communityActivityValue = !_communityActivityValue;
    update();
  }
}