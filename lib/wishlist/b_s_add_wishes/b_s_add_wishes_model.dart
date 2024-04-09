import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_add_wishes_widget.dart' show BSAddWishesWidget;
import 'package:flutter/material.dart';

class BSAddWishesModel extends FlutterFlowModel<BSAddWishesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
