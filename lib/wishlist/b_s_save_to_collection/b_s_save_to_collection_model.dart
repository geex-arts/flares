import '/backend/supabase/supabase.dart';
import '/components/empty_collections_widget_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'b_s_save_to_collection_widget.dart' show BSSaveToCollectionWidget;
import 'package:flutter/material.dart';

class BSSaveToCollectionModel
    extends FlutterFlowModel<BSSaveToCollectionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in Container widget.
  List<WishesRow>? updatedRow;
  // Model for emptyCollectionsWidget component.
  late EmptyCollectionsWidgetModel emptyCollectionsWidgetModel;
  // Model for CreatenewCollection.
  late PinkButtonModel createnewCollectionModel;

  @override
  void initState(BuildContext context) {
    emptyCollectionsWidgetModel =
        createModel(context, () => EmptyCollectionsWidgetModel());
    createnewCollectionModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    emptyCollectionsWidgetModel.dispose();
    createnewCollectionModel.dispose();
  }
}
