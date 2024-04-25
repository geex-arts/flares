import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/components/wishes_list_a_i_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'b_s_a_i_wishlist_widget.dart' show BSAIWishlistWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BSAIWishlistModel extends FlutterFlowModel<BSAIWishlistWidget> {
  ///  Local state fields for this component.

  List<AiWishStruct> wishesAIGeneratedList = [];
  void addToWishesAIGeneratedList(AiWishStruct item) =>
      wishesAIGeneratedList.add(item);
  void removeFromWishesAIGeneratedList(AiWishStruct item) =>
      wishesAIGeneratedList.remove(item);
  void removeAtIndexFromWishesAIGeneratedList(int index) =>
      wishesAIGeneratedList.removeAt(index);
  void insertAtIndexInWishesAIGeneratedList(int index, AiWishStruct item) =>
      wishesAIGeneratedList.insert(index, item);
  void updateWishesAIGeneratedListAtIndex(
          int index, Function(AiWishStruct) updateFn) =>
      wishesAIGeneratedList[index] = updateFn(wishesAIGeneratedList[index]);

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (generateAiWish)] action in BS_AI_Wishlist widget.
  ApiCallResponse? apiResultohpCopy;
  // Model for wishesListAI component.
  late WishesListAIModel wishesListAIModel;
  // Model for Generate.
  late PinkButtonModel generateModel;
  // Stores action output result for [Backend Call - API (generateAiWish)] action in Generate widget.
  ApiCallResponse? apiResultohp;

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
