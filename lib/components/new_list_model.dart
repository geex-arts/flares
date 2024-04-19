import '/components/generate_with_a_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_list_widget.dart' show NewListWidget;
import 'package:flutter/material.dart';

class NewListModel extends FlutterFlowModel<NewListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for generateWithAI component.
  late GenerateWithAIModel generateWithAIModel;

  @override
  void initState(BuildContext context) {
    generateWithAIModel = createModel(context, () => GenerateWithAIModel());
  }

  @override
  void dispose() {
    generateWithAIModel.dispose();
  }
}
