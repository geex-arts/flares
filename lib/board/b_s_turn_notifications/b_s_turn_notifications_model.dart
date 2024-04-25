import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'b_s_turn_notifications_widget.dart' show BSTurnNotificationsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
