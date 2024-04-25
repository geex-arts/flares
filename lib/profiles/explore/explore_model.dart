import '/components/floating_btn_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/wishlist/b_s_budget_location/b_s_budget_location_widget.dart';
import '/wishlist/b_s_feeling/b_s_feeling_widget.dart';
import '/wishlist/b_s_new_collection/b_s_new_collection_widget.dart';
import '/wishlist/b_s_save_to_collection/b_s_save_to_collection_widget.dart';
import '/wishlist/b_s_save_to_collection2/b_s_save_to_collection2_widget.dart';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }
}
