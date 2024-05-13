import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  Local state fields for this page.

  int? emptyFields;

  bool? passLength = false;

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
      return 'Invalid email entered';
    }
    return null;
  }

  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldTextController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldTextControllerValidator;
  // Model for nextButton.
  late PinkButtonModel nextButtonModel;
  // Stores action output result for [Backend Call - Query Rows] action in nextButton widget.
  List<UsersRow>? currentUserRow;
  // Stores action output result for [Backend Call - Query Rows] action in GoogleButton widget.
  List<UsersRow>? foundUserRow;
  // Stores action output result for [Custom Action - appleSignin] action in Row widget.
  String? authResponse;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<UsersRow>? foundUserRow2;

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFieldVisibility = false;
    nextButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldTextController?.dispose();

    nextButtonModel.dispose();
  }
}
