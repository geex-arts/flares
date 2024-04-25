import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/notifications_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
