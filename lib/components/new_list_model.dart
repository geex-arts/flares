import '/components/generate_with_a_i_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_add_wishes/b_s_add_wishes_widget.dart';
import 'new_list_widget.dart' show NewListWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NewListModel extends FlutterFlowModel<NewListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for generateWithAI component.
  late GenerateWithAIModel generateWithAIModel;

  @override
  void initState(BuildContext context) {
    generateWithAIModel = createModel(context, () => GenerateWithAIModel());
  }

  @override
  void dispose() {
    generateWithAIModel.dispose();
  }
}
