import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_save_to_collection2_widget.dart' show BSSaveToCollection2Widget;
import 'package:flutter/material.dart';

class BSSaveToCollection2Model
    extends FlutterFlowModel<BSSaveToCollection2Widget> {
  ///  Local state fields for this component.

  String? selectedCollectionID;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in ConditionalBuilder widget.
  List<WishesRow>? updatedRow;
  // Stores action output result for [Bottom Sheet - N_Save_To_Collection] action in Container widget.
  bool? result;
  // Model for CreatenewCollection.
  late PinkButtonModel createnewCollectionModel;

  @override
  void initState(BuildContext context) {
    createnewCollectionModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    createnewCollectionModel.dispose();
  }
}
