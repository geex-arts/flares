import '/backend/supabase/supabase.dart';
import '/components/loader_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wish_main_widget.dart' show WishMainWidget;
import 'package:flutter/material.dart';

class WishMainModel extends FlutterFlowModel<WishMainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AskForADate.
  late PinkButtonModel askForADateModel;
  // Stores action output result for [Backend Call - Query Rows] action in AskForADate widget.
  List<UsersRow>? partnerRow;
  // Model for MarkAsVisited.
  late PinkButtonModel markAsVisitedModel;
  // Stores action output result for [Backend Call - Query Rows] action in MarkAsVisited widget.
  List<DatesRow>? selectedDate;
  // Model for loader component.
  late LoaderModel loaderModel;

  @override
  void initState(BuildContext context) {
    askForADateModel = createModel(context, () => PinkButtonModel());
    markAsVisitedModel = createModel(context, () => PinkButtonModel());
    loaderModel = createModel(context, () => LoaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    askForADateModel.dispose();
    markAsVisitedModel.dispose();
    loaderModel.dispose();
  }
}
