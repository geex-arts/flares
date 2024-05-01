import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  int? emptyFields;

  bool? passLength = false;

  bool passNotMatch = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid Email';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  String? _passwordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Password must have 8 characters, including letters and numbers.';
    }

    return null;
  }

  // State field(s) for RePasswordField widget.
  FocusNode? rePasswordFieldFocusNode;
  TextEditingController? rePasswordFieldTextController;
  late bool rePasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      rePasswordFieldTextControllerValidator;
  // Model for nextButton.
  late PinkButtonModel nextButtonModel;
  // Stores action output result for [Backend Call - Query Rows] action in nextButton widget.
  List<UsersRow>? existingUser;
  // Stores action output result for [Backend Call - Query Rows] action in GoogleButton widget.
  List<UsersRow>? foundUserRow;
  // Stores action output result for [Custom Action - appleSignin] action in AppleButton widget.
  dynamic authResponse;
  // Stores action output result for [Backend Call - Query Rows] action in AppleButton widget.
  List<UsersRow>? foundUserRow2;

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
    rePasswordFieldVisibility = false;
    nextButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    rePasswordFieldFocusNode?.dispose();
    rePasswordFieldTextController?.dispose();

    nextButtonModel.dispose();
  }
}
