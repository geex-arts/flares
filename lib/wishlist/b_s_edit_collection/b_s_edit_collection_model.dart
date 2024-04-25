import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_edit_collection_widget.dart' show BSEditCollectionWidget;
import 'package:flutter/material.dart';

class BSEditCollectionModel extends FlutterFlowModel<BSEditCollectionWidget> {
  ///  Local state fields for this component.

  bool isEmptyName = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;

  @override
  void initState(BuildContext context) {
    pinkButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    pinkButtonModel.dispose();
  }
}
