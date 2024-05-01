import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wish_main_widget.dart' show WishMainWidget;
import 'package:flutter/material.dart';

class WishMainModel extends FlutterFlowModel<WishMainWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  String? selectedWishID;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in Wish_Main widget.
  List<WishesRow>? selectedWishRow;
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
