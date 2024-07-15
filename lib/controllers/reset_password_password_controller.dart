import 'package:get/get.dart';

class ResetPasswordPasswordController extends GetxController {
  RxBool _obscureText = true.obs;

  RxBool get obscureText => _obscureText;

  void setObscureText() {
    _obscureText.value = !_obscureText.value;
  }
}