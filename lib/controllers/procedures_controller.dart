import 'package:clezigov/models/procedures/procedures.dart';
import 'package:get/get.dart';

class ProceduresController extends GetxController {
  RxList _procedures = procedures.obs;

  List get allProcedures => _procedures;

  void addProcedure(Procedure procedure) {
    _procedures.add(procedure);
    update();
  }

  void removeProcedure(Procedure procedure) {
    _procedures.remove(procedure);
    update();
  }

  void updateProcedure(Procedure procedure) {
    final index = _procedures.indexWhere((p) => p.id == procedure.id);
    _procedures[index] = procedure;
    update();
  }

  // fetch procedure based on id
  Procedure getProcedureById(String id) {
    return _procedures.firstWhere((p) => p.id == id);
  }
}