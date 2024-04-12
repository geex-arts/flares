import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wish_main_widget.dart' show WishMainWidget;
import 'package:flutter/material.dart';

class WishMainModel extends FlutterFlowModel<WishMainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AskForADate.
  late PinkButtonModel askForADateModel;

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
