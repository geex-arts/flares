import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_create_couple_ideas_with_a_i_widget.dart'
    show BSCreateCoupleIdeasWithAIWidget;
import 'package:flutter/material.dart';

class BSCreateCoupleIdeasWithAIModel
    extends FlutterFlowModel<BSCreateCoupleIdeasWithAIWidget> {
  ///  Local state fields for this component.

  List<AiCategoryRow> selectedAICategories = [];
  void addToSelectedAICategories(AiCategoryRow item) =>
      selectedAICategories.add(item);
  void removeFromSelectedAICategories(AiCategoryRow item) =>
      selectedAICategories.remove(item);
  void removeAtIndexFromSelectedAICategories(int index) =>
      selectedAICategories.removeAt(index);
  void insertAtIndexInSelectedAICategories(int index, AiCategoryRow item) =>
      selectedAICategories.insert(index, item);
  void updateSelectedAICategoriesAtIndex(
          int index, Function(AiCategoryRow) updateFn) =>
      selectedAICategories[index] = updateFn(selectedAICategories[index]);

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
