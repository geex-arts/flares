import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/board/b_s_turn_notifications/b_s_turn_notifications_widget.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
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
  String? _rePasswordFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Password must have 8 characters, including letters and numbers.';
    }

    return null;
  }

  // Model for nextButton.
  late PinkButtonModel nextButtonModel;
  // Stores action output result for [Backend Call - Query Rows] action in nextButton widget.
  List<UsersRow>? existingUser;
  // Stores action output result for [Custom Action - getFCMToken] action in nextButton widget.
  String? fcmToken;
  // Stores action output result for [Backend Call - Query Rows] action in nextButton widget.
  List<PairsInvitationsRow>? foundPairingRow;

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
    passwordFieldVisibility = false;
    passwordFieldTextControllerValidator =
        _passwordFieldTextControllerValidator;
    rePasswordFieldVisibility = false;
    rePasswordFieldTextControllerValidator =
        _rePasswordFieldTextControllerValidator;
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
