import '/components/pink_button_widget.dart';
import '/components/wishes_list_a_i_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_a_i_wishlist_widget.dart' show BSAIWishlistWidget;
import 'package:flutter/material.dart';

class BSAIWishlistModel extends FlutterFlowModel<BSAIWishlistWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for wishesListAI component.
  late WishesListAIModel wishesListAIModel;
  // Model for Generate.
  late PinkButtonModel generateModel;

  @override
  void initState(BuildContext context) {
    wishesListAIModel = createModel(context, () => WishesListAIModel());
    generateModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    wishesListAIModel.dispose();
    generateModel.dispose();
  }
}
