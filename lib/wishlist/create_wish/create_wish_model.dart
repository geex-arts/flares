import '/flutter_flow/flutter_flow_util.dart';
import 'create_wish_widget.dart' show CreateWishWidget;
import 'package:flutter/material.dart';

class CreateWishModel extends FlutterFlowModel<CreateWishWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
