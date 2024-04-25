import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/wishlist/b_s_new_collection/b_s_new_collection_widget.dart';
import 'dart:async';
import 'dart:ui';
import 'b_s_add_from_browser_widget.dart' show BSAddFromBrowserWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BSAddFromBrowserModel extends FlutterFlowModel<BSAddFromBrowserWidget> {
  ///  Local state fields for this component.

  String? selectedImage;

  FFUploadedFile? uploadedFile;

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
    if (val.length > 30) {
      return 'Please enter less than 30 characters';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionFieldTextControllerValidator;
  String? _descriptionFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Please enter at least 2 characters';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for SaveToCollection.
  late PinkButtonModel saveToCollectionModel;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Insert Row] action in SaveToCollection widget.
  WishesRow? createdWishRow;
  // Stores action output result for [Backend Call - Query Rows] action in SaveToCollection widget.
  List<CollectionsRow>? selectedCollection;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveToCollection widget.
  List<WishesRow>? updatedRow;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    descriptionFieldTextControllerValidator =
        _descriptionFieldTextControllerValidator;
    saveToCollectionModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();

    saveToCollectionModel.dispose();
  }
}
