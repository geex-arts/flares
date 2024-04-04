import '/flutter_flow/flutter_flow_util.dart';
import 'invite_partner_widget.dart' show InvitePartnerWidget;
import 'package:flutter/material.dart';

class InvitePartnerModel extends FlutterFlowModel<InvitePartnerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SendCodeField widget.
  FocusNode? sendCodeFieldFocusNode;
  TextEditingController? sendCodeFieldController;
  String? Function(BuildContext, String?)? sendCodeFieldControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    sendCodeFieldFocusNode?.dispose();
    sendCodeFieldController?.dispose();
  }
}
