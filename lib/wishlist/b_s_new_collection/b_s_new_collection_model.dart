import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_new_collection_widget.dart' show BSNewCollectionWidget;
import 'package:flutter/material.dart';

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
