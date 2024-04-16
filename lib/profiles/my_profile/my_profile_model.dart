import '/backend/api_requests/api_calls.dart';
import '/components/floating_btn_widget.dart';
import '/components/generate_with_a_i_widget.dart';
import '/components/pink_button_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  String? selectedCollectionID;

  String? currentURL;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (parseSite)] action in My_Profile widget.
  ApiCallResponse? apiResultParseURL;
  // Stores action output result for [Backend Call - API (generateAiSimiliarWish)] action in Column widget.
  ApiCallResponse? apiResultc17Copy;
  // Stores action output result for [Backend Call - API (generateAiWish)] action in Column widget.
  ApiCallResponse? apiResultc16Copy;
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;
  // Model for wishesListMain component.
  late WishesListMainModel wishesListMainModel;
  // Model for generateWithAI component.
  late GenerateWithAIModel generateWithAIModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  String currentPageLink = '';
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    pinkButtonModel = createModel(context, () => PinkButtonModel());
    wishesListMainModel = createModel(context, () => WishesListMainModel());
    generateWithAIModel = createModel(context, () => GenerateWithAIModel());
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinkButtonModel.dispose();
    wishesListMainModel.dispose();
    generateWithAIModel.dispose();
    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }
}
