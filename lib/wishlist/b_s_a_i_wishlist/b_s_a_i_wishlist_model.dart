import '/components/card_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_a_i_wishlist_widget.dart' show BSAIWishlistWidget;
import 'package:flutter/material.dart';

class BSAIWishlistModel extends FlutterFlowModel<BSAIWishlistWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for card component.
  late CardModel cardModel1;
  // Model for card component.
  late CardModel cardModel2;
  // Model for card component.
  late CardModel cardModel3;
  // Model for card component.
  late CardModel cardModel4;
  // Model for card component.
  late CardModel cardModel5;
  // Model for card component.
  late CardModel cardModel6;
  // Model for Generate.
  late PinkButtonModel generateModel;

  @override
  void initState(BuildContext context) {
    cardModel1 = createModel(context, () => CardModel());
    cardModel2 = createModel(context, () => CardModel());
    cardModel3 = createModel(context, () => CardModel());
    cardModel4 = createModel(context, () => CardModel());
    cardModel5 = createModel(context, () => CardModel());
    cardModel6 = createModel(context, () => CardModel());
    generateModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    cardModel1.dispose();
    cardModel2.dispose();
    cardModel3.dispose();
    cardModel4.dispose();
    cardModel5.dispose();
    cardModel6.dispose();
    generateModel.dispose();
  }
}
