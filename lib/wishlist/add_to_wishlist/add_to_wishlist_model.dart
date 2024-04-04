import '/flutter_flow/flutter_flow_util.dart';
import 'add_to_wishlist_widget.dart' show AddToWishlistWidget;
import 'package:flutter/material.dart';

class AddToWishlistModel extends FlutterFlowModel<AddToWishlistWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
