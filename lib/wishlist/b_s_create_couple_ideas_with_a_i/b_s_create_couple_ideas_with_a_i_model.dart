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
