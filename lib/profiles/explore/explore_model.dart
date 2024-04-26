import '/components/floating_btn_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  Local state fields for this page.

  List<String> popularWishesIDs = [];
  void addToPopularWishesIDs(String item) => popularWishesIDs.add(item);
  void removeFromPopularWishesIDs(String item) => popularWishesIDs.remove(item);
  void removeAtIndexFromPopularWishesIDs(int index) =>
      popularWishesIDs.removeAt(index);
  void insertAtIndexInPopularWishesIDs(int index, String item) =>
      popularWishesIDs.insert(index, item);
  void updatePopularWishesIDsAtIndex(int index, Function(String) updateFn) =>
      popularWishesIDs[index] = updateFn(popularWishesIDs[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }
}
