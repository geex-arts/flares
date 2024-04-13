import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_password_widget.dart' show NewPasswordWidget;
import 'package:flutter/material.dart';

class NewPasswordModel extends FlutterFlowModel<NewPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  // State field(s) for RePasswordField widget.
  FocusNode? rePasswordFieldFocusNode;
  TextEditingController? rePasswordFieldController;
  late bool rePasswordFieldVisibility;
  String? Function(BuildContext, String?)? rePasswordFieldControllerValidator;
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;

  @override
  void initState(BuildContext context) {
    passwordFieldVisibility = false;
    rePasswordFieldVisibility = false;
    pinkButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    passwordFieldFocusNode?.dispose();
    passwordFieldController?.dispose();

    rePasswordFieldFocusNode?.dispose();
    rePasswordFieldController?.dispose();

    pinkButtonModel.dispose();
  }
}
