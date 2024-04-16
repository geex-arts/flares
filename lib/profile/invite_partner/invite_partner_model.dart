import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_partner_widget.dart' show InvitePartnerWidget;
import 'package:flutter/material.dart';

class InvitePartnerModel extends FlutterFlowModel<InvitePartnerWidget> {
  ///  Local state fields for this page.

  String? code = 'my code';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Sharemyinvitelink.
  late PinkButtonModel sharemyinvitelinkModel;
  // State field(s) for SendCodeField widget.
  FocusNode? sendCodeFieldFocusNode;
  TextEditingController? sendCodeFieldTextController;
  String? Function(BuildContext, String?)? sendCodeFieldTextControllerValidator;
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
    sendCodeFieldTextController?.dispose();

    sendPairingCodeModel.dispose();
  }
}
