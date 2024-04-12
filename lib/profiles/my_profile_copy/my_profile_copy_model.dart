import '/backend/api_requests/api_calls.dart';
import '/components/floating_btn_widget.dart';
import '/components/generate_with_a_i_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_profile_copy_widget.dart' show MyProfileCopyWidget;
import 'package:flutter/material.dart';

class MyProfileCopyModel extends FlutterFlowModel<MyProfileCopyWidget> {
  ///  Local state fields for this page.

  String? selectedCollectionID;

  String? currentURL;

  String? previousURL = ' ';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (parseSite)] action in My_ProfileCopy widget.
  ApiCallResponse? apiResultParseURL;
  // Stores action output result for [Backend Call - API (generateAiSimiliarWish)] action in Column widget.
  ApiCallResponse? apiResultc17Copy;
  // Stores action output result for [Backend Call - API (generateAiWish)] action in Column widget.
  ApiCallResponse? apiResultc16Copy;
  // Model for wishesListMain component.
  late WishesListMainModel wishesListMainModel;
  // Model for generateWithAI component.
  late GenerateWithAIModel generateWithAIModel1;
  // Model for generateWithAI component.
  late GenerateWithAIModel generateWithAIModel2;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    wishesListMainModel = createModel(context, () => WishesListMainModel());
    generateWithAIModel1 = createModel(context, () => GenerateWithAIModel());
    generateWithAIModel2 = createModel(context, () => GenerateWithAIModel());
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    wishesListMainModel.dispose();
    generateWithAIModel1.dispose();
    generateWithAIModel2.dispose();
    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }
}
