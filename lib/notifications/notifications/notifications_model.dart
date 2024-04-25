import '/components/notifications_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for notificationsList component.
  late NotificationsListModel notificationsListModel1;
  // Model for notificationsList component.
  late NotificationsListModel notificationsListModel2;
  // Model for notificationsList component.
  late NotificationsListModel notificationsListModel3;

  @override
  void initState(BuildContext context) {
    notificationsListModel1 =
        createModel(context, () => NotificationsListModel());
    notificationsListModel2 =
        createModel(context, () => NotificationsListModel());
    notificationsListModel3 =
        createModel(context, () => NotificationsListModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    notificationsListModel1.dispose();
    notificationsListModel2.dispose();
    notificationsListModel3.dispose();
  }
}
