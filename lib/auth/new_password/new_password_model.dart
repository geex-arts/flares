import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'new_password_widget.dart' show NewPasswordWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
