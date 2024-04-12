import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wish_main_widget.dart' show WishMainWidget;
import 'package:flutter/material.dart';

class WishMainModel extends FlutterFlowModel<WishMainWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AddtoWishlist.
  late PinkButtonModel addtoWishlistModel;
  // Model for AskForADate.
  late PinkButtonModel askForADateModel;

  @override
  void initState(BuildContext context) {
    addtoWishlistModel = createModel(context, () => PinkButtonModel());
    askForADateModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addtoWishlistModel.dispose();
    askForADateModel.dispose();
  }
}
