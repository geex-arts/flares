import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'invite_partner_onb_widget.dart' show InvitePartnerOnbWidget;
import 'package:flutter/material.dart';

class InvitePartnerOnbModel extends FlutterFlowModel<InvitePartnerOnbWidget> {
  ///  Local state fields for this page.

  String? pairingCode;

  bool codeNotFound = false;

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
  // Stores action output result for [Backend Call - Query Rows] action in SendPairingCode widget.
  List<PairsInvitationsRow>? foundPairingRow;

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
