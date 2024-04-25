import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_budget_location/b_s_budget_location_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'b_s_create_couple_ideas_with_a_i_widget.dart'
    show BSCreateCoupleIdeasWithAIWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
