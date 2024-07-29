import 'package:get/get.dart';

class ReactionsController extends GetxController {
  // Create a list of map of string, string to store procedure_id: reaction
  List<Map<String, String>> _reactions = [];

  // Create a function to get all reactions
  List<Map<String, String>> get reactions => _reactions;

  // Create a function to add a reaction to the list
  void addReaction(String procedureId, String reaction) {
    // Check if the procedureId is already in the list
    final index = _reactions.indexWhere((element) => element.keys.first == procedureId);
    // If the procedureId is in the list, update the reaction
    if (index != -1) {
      _reactions[index][procedureId] = reaction;
    } else {
      // If the procedureId is not in the list, add it
      _reactions.add({procedureId: reaction});
    }
    // Update the UI
    update();
  }

  // Create a function to get the reaction of a procedure
  String getReaction(String procedureId) {
    // Check if the procedureId is in the list
    final index = _reactions.indexWhere((element) => element.keys.first == procedureId);
    // If the procedureId is in the list, return the reaction
    if (index != -1) {
      return _reactions[index][procedureId]!;
    }
    // If the procedureId is not in the list, return an empty string
    return '';
  }

  // Create a function to remove a reaction from the list
  void removeReaction(String procedureId) {
    // Check if the procedureId is in the list
    final index = _reactions.indexWhere((element) => element.keys.first == procedureId);
    // If the procedureId is in the list, remove it
    if (index != -1) {
      _reactions.removeAt(index);
    }
    // Update the UI
    update();
  }

  // Create a function to clear all reactions
  void clearReactions() {
    // Clear the list
    _reactions.clear();
    // Update the UI
    update();
  }

  // Create a function to check if a procedure has a reaction
  bool hasReaction(String procedureId) {
    // Check if the procedureId is in the list
    final index = _reactions.indexWhere((element) => element.keys.first == procedureId);
    // If the procedureId is in the list, return true
    if (index != -1) {
      return true;
    }
    // If the procedureId is not in the list, return false
    return false;
  }

  // Create a function to get the total number of reactions
  int get totalReactions => _reactions.length;

  // Create a function to get the total number of reactions for a specific reaction
  int totalReactionsFor(String reaction) {
    // Filter the list to get the reactions with the specific reaction
    final reactions = _reactions.where((element) => element.values.first == reaction);
    // Return the total number of reactions
    return reactions.length;
  }

  // Create a function to get the total number of reactions for a specific procedure
  int totalReactionsForProcedure(String procedureId) {
    // Filter the list to get the reactions for the specific procedure
    final reactions = _reactions.where((element) => element.keys.first == procedureId);
    // Return the total number of reactions
    return reactions.length;
  }

  // Create a function to get the total number of reactions for a specific procedure and reaction
  int totalReactionsForProcedureAndReaction(String procedureId, String reaction) {
    // Filter the list to get the reactions for the specific procedure and reaction
    final reactions = _reactions.where((element) => element.keys.first == procedureId && element.values.first == reaction);
    // Return the total number of reactions
    return reactions.length;
  }
}