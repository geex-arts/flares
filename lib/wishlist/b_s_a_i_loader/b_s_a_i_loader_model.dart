import '/components/loader_placeholder_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'b_s_a_i_loader_widget.dart' show BSAILoaderWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
