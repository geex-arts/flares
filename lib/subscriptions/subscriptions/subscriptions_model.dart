import '/board/b_s_turn_notifications/b_s_turn_notifications_widget.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/subscriptions/n_offer/n_offer_widget.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'subscriptions_widget.dart' show SubscriptionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SubscriptionsModel extends FlutterFlowModel<SubscriptionsWidget> {
  ///  Local state fields for this page.

  int selectedPlan = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ContinueButton.
  late PinkButtonModel continueButtonModel;
  // Stores action output result for [RevenueCat - Purchase] action in ContinueButton widget.
  bool? monthlyResult;
  // Stores action output result for [RevenueCat - Purchase] action in ContinueButton widget.
  bool? annuallyResult;

  @override
  void initState(BuildContext context) {
    continueButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    continueButtonModel.dispose();
  }
}
