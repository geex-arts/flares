import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_cancel_collection_widget.dart';
import '/components/floating_btn_widget.dart';
import '/components/new_list_widget.dart';
import '/components/nf_icon_placeholder_widget.dart';
import '/components/nf_loading_placeholder_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/wishlist/b_s_feeling/b_s_feeling_widget.dart';
import '/wishlist/b_s_save_to_collection2/b_s_save_to_collection2_widget.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  String? selectedCollectionID;

  String? currentURL;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (generateAiSimiliarWish)] action in Column widget.
  ApiCallResponse? apiResultc17Copy;
  // Stores action output result for [Backend Call - API (generateAiWish)] action in Column widget.
  ApiCallResponse? apiResultc16Copy;
  // Model for wishesListMain component.
  late WishesListMainModel wishesListMainModel;
  // Model for newList component.
  late NewListModel newListModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    wishesListMainModel = createModel(context, () => WishesListMainModel());
    newListModel = createModel(context, () => NewListModel());
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    wishesListMainModel.dispose();
    newListModel.dispose();
    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }
}
