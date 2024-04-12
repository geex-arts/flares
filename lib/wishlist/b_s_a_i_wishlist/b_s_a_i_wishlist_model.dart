import '/components/pink_button_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_a_i_wishlist_widget.dart' show BSAIWishlistWidget;
import 'package:flutter/material.dart';

class BSAIWishlistModel extends FlutterFlowModel<BSAIWishlistWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for wishesListMain component.
  late WishesListMainModel wishesListMainModel;
  // Model for Generate.
  late PinkButtonModel generateModel;

  @override
  void initState(BuildContext context) {
    wishesListMainModel = createModel(context, () => WishesListMainModel());
    generateModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    wishesListMainModel.dispose();
    generateModel.dispose();
  }
}
