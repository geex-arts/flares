import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_new_collection_widget.dart' show BSNewCollectionWidget;
import 'package:flutter/material.dart';

class BSNewCollectionModel extends FlutterFlowModel<BSNewCollectionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for Create.
  late PinkButtonModel createModel;

  @override
  void initState(BuildContext context) {
    createModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    createModel.dispose();
  }
}
