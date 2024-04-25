import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscriptions_widget.dart' show SubscriptionsWidget;
import 'package:flutter/material.dart';

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
  // Stores action output result for [RevenueCat - Purchase] action in ContinueButton widget.
  bool? lifetimeResult;

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
