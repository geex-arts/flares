import '/flutter_flow/flutter_flow_util.dart';
import 'create_couple_profile_widget.dart' show CreateCoupleProfileWidget;
import 'package:flutter/material.dart';

class CreateCoupleProfileModel
    extends FlutterFlowModel<CreateCoupleProfileWidget> {
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
