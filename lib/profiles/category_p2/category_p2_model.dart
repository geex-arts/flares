import '/components/card_widget.dart';
import '/components/floating_btn_widget.dart';
import '/components/generate_with_a_i_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_p2_widget.dart' show CategoryP2Widget;
import 'package:flutter/material.dart';

class CategoryP2Model extends FlutterFlowModel<CategoryP2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for card component.
  late CardModel cardModel1;
  // Model for card component.
  late CardModel cardModel2;
  // Model for card component.
  late CardModel cardModel3;
  // Model for card component.
  late CardModel cardModel4;
  // Model for card component.
  late CardModel cardModel5;
  // Model for card component.
  late CardModel cardModel6;
  // Model for generateWithAI component.
  late GenerateWithAIModel generateWithAIModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    cardModel1 = createModel(context, () => CardModel());
    cardModel2 = createModel(context, () => CardModel());
    cardModel3 = createModel(context, () => CardModel());
    cardModel4 = createModel(context, () => CardModel());
    cardModel5 = createModel(context, () => CardModel());
    cardModel6 = createModel(context, () => CardModel());
    generateWithAIModel = createModel(context, () => GenerateWithAIModel());
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cardModel1.dispose();
    cardModel2.dispose();
    cardModel3.dispose();
    cardModel4.dispose();
    cardModel5.dispose();
    cardModel6.dispose();
    generateWithAIModel.dispose();
    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }
}
