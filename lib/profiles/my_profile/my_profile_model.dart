import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/floating_btn_widget.dart';
import '/components/new_list_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  String? selectedCollectionID;

  String? currentURL;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in My_Profile widget.
  List<PairsRow>? pairRow;
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
