import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_budget_location_widget.dart' show BSBudgetLocationWidget;
import 'package:flutter/material.dart';

class BSBudgetLocationModel extends FlutterFlowModel<BSBudgetLocationWidget> {
  ///  Local state fields for this component.

  String budget = 'moderate';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }
    if (val != textFieldSelectedOption) {
      return 'Field is required';
    }
    if (val.length < 2) {
      return 'Please enter at least 2 characters';
    }

    return null;
  }

  // Model for Generate.
  late PinkButtonModel generateModel;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
    generateModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();

    generateModel.dispose();
  }
}
