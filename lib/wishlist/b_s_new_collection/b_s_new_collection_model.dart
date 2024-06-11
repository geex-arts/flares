import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_new_collection_widget.dart' show BSNewCollectionWidget;
import 'package:flutter/material.dart';

class BSNewCollectionModel extends FlutterFlowModel<BSNewCollectionWidget> {
  ///  Local state fields for this component.

  bool isEmptyName = false;

  bool isSwitch = true;

  bool isBlocked = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 14) {
      return 'Name must be less then 15 characters';
    }

    return null;
  }

  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;
  // Stores action output result for [Backend Call - Query Rows] action in pinkButton widget.
  List<CollectionsRow>? collectionsRows;
  // Stores action output result for [Backend Call - Insert Row] action in pinkButton widget.
  CollectionsRow? newCollectionRowCopy;
  // Model for pinkButton2.
  late PinkButtonModel pinkButton2Model;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    pinkButtonModel = createModel(context, () => PinkButtonModel());
    pinkButton2Model = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    pinkButtonModel.dispose();
    pinkButton2Model.dispose();
  }
}
