import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'more_widget.dart' show MoreWidget;
import 'package:flutter/material.dart';

class MoreModel extends FlutterFlowModel<MoreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;

  @override
  void initState(BuildContext context) {
    pinkButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pinkButtonModel.dispose();
  }
}
