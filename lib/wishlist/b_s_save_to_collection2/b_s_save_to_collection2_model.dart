import '/backend/supabase/supabase.dart';
import '/components/empty_collections_widget_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_edit_collection/b_s_edit_collection_widget.dart';
import '/wishlist/b_s_new_collection/b_s_new_collection_widget.dart';
import '/wishlist/n_save_to_collection/n_save_to_collection_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'b_s_save_to_collection2_widget.dart' show BSSaveToCollection2Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BSSaveToCollection2Model
    extends FlutterFlowModel<BSSaveToCollection2Widget> {
  ///  Local state fields for this component.

  String? selectedCollectionID;

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Update Row(s)] action in ConditionalBuilder widget.
  List<WishesRow>? updatedRow;
  // Stores action output result for [Bottom Sheet - N_Save_To_Collection] action in Container widget.
  bool? result;
  // Model for CreatenewCollection.
  late PinkButtonModel createnewCollectionModel;

  @override
  void initState(BuildContext context) {
    createnewCollectionModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    createnewCollectionModel.dispose();
  }
}
