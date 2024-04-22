import '/components/empty_add_tour_own_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_filling_widget.dart' show BSFillingWidget;
import 'package:flutter/material.dart';

class BSFillingModel extends FlutterFlowModel<BSFillingWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for emptyAddTourOwn component.
  late EmptyAddTourOwnModel emptyAddTourOwnModel;
  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;

  @override
  void initState(BuildContext context) {
    emptyAddTourOwnModel = createModel(context, () => EmptyAddTourOwnModel());
    pinkButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    emptyAddTourOwnModel.dispose();
    pinkButtonModel.dispose();
  }
}
