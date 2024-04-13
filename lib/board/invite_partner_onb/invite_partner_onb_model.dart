import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/board/b_s_turn_notifications/b_s_turn_notifications_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'invite_partner_onb_widget.dart' show InvitePartnerOnbWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

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
  TextEditingController? sendCodeFieldController;
  String? Function(BuildContext, String?)? sendCodeFieldControllerValidator;
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
    sendCodeFieldController?.dispose();

    sendPairingCodeModel.dispose();
  }
}
