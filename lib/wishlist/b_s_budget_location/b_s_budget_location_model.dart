import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'b_s_budget_location_widget.dart' show BSBudgetLocationWidget;
import 'package:flutter/material.dart';

class BSBudgetLocationModel extends FlutterFlowModel<BSBudgetLocationWidget> {
  ///  Local state fields for this component.

  String budget = 'moderate';

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for Generate.
  late PinkButtonModel generateModel;

  @override
  void initState(BuildContext context) {
    generateModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    generateModel.dispose();
  }
}
