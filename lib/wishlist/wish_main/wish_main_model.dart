import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/wishlist/b_s_ask_day/b_s_ask_day_widget.dart';
import '/wishlist/b_s_save_to_collection/b_s_save_to_collection_widget.dart';
import 'wish_main_widget.dart' show WishMainWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class WishMainModel extends FlutterFlowModel<WishMainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AskForADate.
  late PinkButtonModel askForADateModel;
  // Stores action output result for [Backend Call - Query Rows] action in AskForADate widget.
  List<UsersRow>? partnerRow;

  @override
  void initState(BuildContext context) {
    askForADateModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    askForADateModel.dispose();
  }
}
