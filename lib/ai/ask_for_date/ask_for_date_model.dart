import '/flutter_flow/flutter_flow_util.dart';
import 'ask_for_date_widget.dart' show AskForDateWidget;
import 'package:flutter/material.dart';

class AskForDateModel extends FlutterFlowModel<AskForDateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
