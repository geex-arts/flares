import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import 'b_s_new_collection_widget.dart' show BSNewCollectionWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BSNewCollectionModel extends FlutterFlowModel<BSNewCollectionWidget> {
  ///  Local state fields for this component.

  bool isEmptyName = false;

  bool isSwitch = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;
  // Stores action output result for [Backend Call - Query Rows] action in pinkButton widget.
  List<CollectionsRow>? collectionsRows;
  // Stores action output result for [Backend Call - Insert Row] action in pinkButton widget.
  CollectionsRow? newCollectionRowCopy;

  @override
  void initState(BuildContext context) {
    pinkButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    pinkButtonModel.dispose();
  }
}
