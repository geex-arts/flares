import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_turn_notifications_widget.dart' show BSTurnNotificationsWidget;
import 'package:flutter/material.dart';

class BSTurnNotificationsModel
    extends FlutterFlowModel<BSTurnNotificationsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TurnOnNotifications.
  late PinkButtonModel turnOnNotificationsModel;

  @override
  void initState(BuildContext context) {
    turnOnNotificationsModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    turnOnNotificationsModel.dispose();
  }
}
