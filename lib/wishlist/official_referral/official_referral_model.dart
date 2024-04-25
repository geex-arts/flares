import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'official_referral_widget.dart' show OfficialReferralWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfficialReferralModel extends FlutterFlowModel<OfficialReferralWidget> {
  ///  Local state fields for this page.

  String? code = 'my code';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;

  @override
  void initState(BuildContext context) {
    pinkButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinkButtonModel.dispose();
  }
}
