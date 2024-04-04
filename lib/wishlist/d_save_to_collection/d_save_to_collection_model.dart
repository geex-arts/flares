import '/flutter_flow/flutter_flow_util.dart';
import 'd_save_to_collection_widget.dart' show DSaveToCollectionWidget;
import 'package:flutter/material.dart';

class DSaveToCollectionModel extends FlutterFlowModel<DSaveToCollectionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
