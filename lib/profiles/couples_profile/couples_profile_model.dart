import '/backend/api_requests/api_calls.dart';
import '/components/floating_btn_widget.dart';
import '/components/generate_with_a_i_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'couples_profile_widget.dart' show CouplesProfileWidget;
import 'package:flutter/material.dart';

class CouplesProfileModel extends FlutterFlowModel<CouplesProfileWidget> {
  ///  Local state fields for this page.

  String? selectedCollectionID;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (generateAiSimiliarWish)] action in Column widget.
  ApiCallResponse? apiResultc17Copy;
  // Stores action output result for [Backend Call - API (generateAiWish)] action in Column widget.
  ApiCallResponse? apiResultc16Copy;
  // Model for wishesList.
  late WishesListMainModel wishesListModel;
  // Model for generateWithAI component.
  late GenerateWithAIModel generateWithAIModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    wishesListModel = createModel(context, () => WishesListMainModel());
    generateWithAIModel = createModel(context, () => GenerateWithAIModel());
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    wishesListModel.dispose();
    generateWithAIModel.dispose();
    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }
}
