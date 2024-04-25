import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_wish_reaction_widget.dart' show AddWishReactionWidget;
import 'package:flutter/material.dart';

class AddWishReactionModel extends FlutterFlowModel<AddWishReactionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in Image widget.
  List<UsersRow>? partnerRow;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
