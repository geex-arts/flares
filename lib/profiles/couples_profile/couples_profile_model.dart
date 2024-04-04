import '/flutter_flow/flutter_flow_util.dart';
import 'couples_profile_widget.dart' show CouplesProfileWidget;
import 'package:flutter/material.dart';

class CouplesProfileModel extends FlutterFlowModel<CouplesProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
