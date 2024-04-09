import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'b_s_add_from_browser_widget.dart' show BSAddFromBrowserWidget;
import 'package:flutter/material.dart';

class BSAddFromBrowserModel extends FlutterFlowModel<BSAddFromBrowserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode1;
  TextEditingController? nameFieldController1;
  String? Function(BuildContext, String?)? nameFieldController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode2;
  TextEditingController? nameFieldController2;
  String? Function(BuildContext, String?)? nameFieldController2Validator;
  // Model for SaveToCollection.
  late PinkButtonModel saveToCollectionModel;

  @override
  void initState(BuildContext context) {
    saveToCollectionModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    nameFieldFocusNode1?.dispose();
    nameFieldController1?.dispose();

    nameFieldFocusNode2?.dispose();
    nameFieldController2?.dispose();

    saveToCollectionModel.dispose();
  }
}
