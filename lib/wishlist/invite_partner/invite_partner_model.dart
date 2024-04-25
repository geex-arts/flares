import '/board/b_s_turn_notifications/b_s_turn_notifications_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'invite_partner_widget.dart' show InvitePartnerWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
