import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_add_tour_own_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'b_s_feeling_widget.dart' show BSFeelingWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BSFeelingModel extends FlutterFlowModel<BSFeelingWidget> {
  ///  Local state fields for this component.

  Color selectedColor = Color(4293399874);

  String selectedFeeling = '🤗 Chill';

  bool isCustom = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Please enter at least 2 characters';
    }
    if (val.length > 15) {
      return 'Please enter less than 16 characters';
    }

    return null;
  }

  // Model for emptyAddTourOwn component.
  late EmptyAddTourOwnModel emptyAddTourOwnModel;
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;
  // Stores action output result for [Backend Call - Insert Row] action in pinkButton widget.
  UserFeelingsRow? newUserFeelingRow;
  // Stores action output result for [Backend Call - Query Rows] action in pinkButton widget.
  List<FeelingsRow>? foundFeelingRow;
  // Stores action output result for [Backend Call - Query Rows] action in pinkButton widget.
  List<UserFeelingsRow>? foundUserFeeling;
  // Stores action output result for [Backend Call - Update Row(s)] action in pinkButton widget.
  List<UserFeelingsRow>? updatedUserFeelingRow;
  // Stores action output result for [Backend Call - Insert Row] action in pinkButton widget.
  UserFeelingsRow? newUserFeelingRow3;
  // Stores action output result for [Backend Call - Query Rows] action in pinkButton widget.
  List<UserFeelingsRow>? foundUserCustomFeeling;
  // Stores action output result for [Backend Call - Update Row(s)] action in pinkButton widget.
  List<UserFeelingsRow>? updatedUserFeelingRow2;
  // Stores action output result for [Backend Call - Query Rows] action in pinkButton widget.
  List<FeelingsRow>? foundFeelingRow2;
  // Stores action output result for [Backend Call - Insert Row] action in pinkButton widget.
  UserFeelingsRow? newUserFeelingRow2;
  // Stores action output result for [Backend Call - Query Rows] action in pinkButton widget.
  List<UsersRow>? partnerRow;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    emptyAddTourOwnModel = createModel(context, () => EmptyAddTourOwnModel());
    pinkButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    emptyAddTourOwnModel.dispose();
    pinkButtonModel.dispose();
  }
}
