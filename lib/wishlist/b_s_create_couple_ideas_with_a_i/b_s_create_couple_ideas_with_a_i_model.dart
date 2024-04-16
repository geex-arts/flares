import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_create_couple_ideas_with_a_i_widget.dart'
    show BSCreateCoupleIdeasWithAIWidget;
import 'package:flutter/material.dart';

class BSCreateCoupleIdeasWithAIModel
    extends FlutterFlowModel<BSCreateCoupleIdeasWithAIWidget> {
  ///  Local state fields for this component.

  List<String> selectedCategoriesNames = [];
  void addToSelectedCategoriesNames(String item) =>
      selectedCategoriesNames.add(item);
  void removeFromSelectedCategoriesNames(String item) =>
      selectedCategoriesNames.remove(item);
  void removeAtIndexFromSelectedCategoriesNames(int index) =>
      selectedCategoriesNames.removeAt(index);
  void insertAtIndexInSelectedCategoriesNames(int index, String item) =>
      selectedCategoriesNames.insert(index, item);
  void updateSelectedCategoriesNamesAtIndex(
          int index, Function(String) updateFn) =>
      selectedCategoriesNames[index] = updateFn(selectedCategoriesNames[index]);

  ///  State fields for stateful widgets in this component.

  // Model for Generate.
  late PinkButtonModel generateModel;

  @override
  void initState(BuildContext context) {
    generateModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    generateModel.dispose();
  }
}
