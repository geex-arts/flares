import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_create_couple_ideas_with_a_i_widget.dart'
    show BSCreateCoupleIdeasWithAIWidget;
import 'package:flutter/material.dart';

class BSCreateCoupleIdeasWithAIModel
    extends FlutterFlowModel<BSCreateCoupleIdeasWithAIWidget> {
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
