import '/flutter_flow/flutter_flow_util.dart';
import 'assistant_view_widget.dart' show AssistantViewWidget;
import 'package:flutter/material.dart';

class AssistantViewModel extends FlutterFlowModel<AssistantViewWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
