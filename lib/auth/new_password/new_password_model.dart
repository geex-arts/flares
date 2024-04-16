import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_password_widget.dart' show NewPasswordWidget;
import 'package:flutter/material.dart';

class NewPasswordModel extends FlutterFlowModel<NewPasswordWidget> {
  ///  Local state fields for this page.

  bool isNotMatch = false;

  bool isWrongPassword = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  // State field(s) for RePasswordField widget.
  FocusNode? rePasswordFieldFocusNode;
  TextEditingController? rePasswordFieldTextController;
  late bool rePasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      rePasswordFieldTextControllerValidator;
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;
  // Stores action output result for [Custom Action - changePassword] action in pinkButton widget.
  bool? isSuccess;

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
    passwordFieldTextController?.dispose();

    rePasswordFieldFocusNode?.dispose();
    rePasswordFieldTextController?.dispose();

    pinkButtonModel.dispose();
  }
}
