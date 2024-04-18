import '/components/loader_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_a_i_loader_widget.dart' show BSAILoaderWidget;
import 'package:flutter/material.dart';

class BSAILoaderModel extends FlutterFlowModel<BSAILoaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for loaderPlaceholder component.
  late LoaderPlaceholderModel loaderPlaceholderModel;

  @override
  void initState(BuildContext context) {
    loaderPlaceholderModel =
        createModel(context, () => LoaderPlaceholderModel());
  }

  @override
  void dispose() {
    loaderPlaceholderModel.dispose();
  }
}
