import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subscriptions_widget.dart' show SubscriptionsWidget;
import 'package:flutter/material.dart';

class SubscriptionsModel extends FlutterFlowModel<SubscriptionsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ContinueButton.
  late PinkButtonModel continueButtonModel;
  // Stores action output result for [RevenueCat - Purchase] action in ContinueButton widget.
  bool? test;

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
