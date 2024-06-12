import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'past_dates_widget.dart' show PastDatesWidget;
import 'package:flutter/material.dart';

class PastDatesModel extends FlutterFlowModel<PastDatesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for tabBar component.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarModel.dispose();
  }
}
