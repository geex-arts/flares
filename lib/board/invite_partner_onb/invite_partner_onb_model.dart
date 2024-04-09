import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_partner_onb_widget.dart' show InvitePartnerOnbWidget;
import 'package:flutter/material.dart';

class InvitePartnerOnbModel extends FlutterFlowModel<InvitePartnerOnbWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Sharemyinvitelink.
  late PinkButtonModel sharemyinvitelinkModel;
  // State field(s) for SendCodeField widget.
  FocusNode? sendCodeFieldFocusNode;
  TextEditingController? sendCodeFieldController;
  String? Function(BuildContext, String?)? sendCodeFieldControllerValidator;
  // Model for SendPairingCode.
  late PinkButtonModel sendPairingCodeModel;

  @override
  void initState(BuildContext context) {
    sharemyinvitelinkModel = createModel(context, () => PinkButtonModel());
    sendPairingCodeModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sharemyinvitelinkModel.dispose();
    sendCodeFieldFocusNode?.dispose();
    sendCodeFieldController?.dispose();

    sendPairingCodeModel.dispose();
  }
}
