import '/components/floating_btn_widget.dart';
import '/components/generate_with_a_i_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_p2_widget.dart' show CategoryP2Widget;
import 'package:flutter/material.dart';

class CategoryP2Model extends FlutterFlowModel<CategoryP2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for generateWithAI component.
  late GenerateWithAIModel generateWithAIModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    generateWithAIModel = createModel(context, () => GenerateWithAIModel());
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    generateWithAIModel.dispose();
    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }
}
