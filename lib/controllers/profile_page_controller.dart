import 'package:clezigov/views/screens/home/procedure_details.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  String _selectedRoute = ProcedureDetailsPage.routeName;

  String get selectedRoute => _selectedRoute;

  void setSelectedRoute(String route) {
    _selectedRoute = route;
    update();
  }

  bool isRouteSelected(String route) {
    return _selectedRoute == route;
  }
}