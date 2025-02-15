import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';
  // Stores action output result for [Backend Call - Query Rows] action in EditCoupleProfileContainer widget.
  List<PairsRow>? myPairRow;
  // Stores action output result for [Backend Call - Query Rows] action in NotificationsContainer widget.
  List<UsersRow>? userRow;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
