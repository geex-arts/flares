import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_couple_profile_widget.dart' show EditCoupleProfileWidget;
import 'package:flutter/material.dart';

class EditCoupleProfileModel extends FlutterFlowModel<EditCoupleProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NamesField widget.
  FocusNode? namesFieldFocusNode;
  TextEditingController? namesFieldController;
  String? Function(BuildContext, String?)? namesFieldControllerValidator;
  // State field(s) for SinceField widget.
  FocusNode? sinceFieldFocusNode;
  TextEditingController? sinceFieldController;
  String? Function(BuildContext, String?)? sinceFieldControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    namesFieldFocusNode?.dispose();
    namesFieldController?.dispose();

    sinceFieldFocusNode?.dispose();
    sinceFieldController?.dispose();
  }
}
