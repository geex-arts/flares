import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'b_s_add_from_browser_widget.dart' show BSAddFromBrowserWidget;
import 'package:flutter/material.dart';

class BSAddFromBrowserModel extends FlutterFlowModel<BSAddFromBrowserWidget> {
  ///  Local state fields for this component.

  String? selectedImage;

  FFUploadedFile? uploadedFile;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Please enter at least 2 characters';
    }
    if (val.length > 30) {
      return 'Please enter below 30 characters';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for DescriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldController;
  String? Function(BuildContext, String?)? descriptionFieldControllerValidator;
  String? _descriptionFieldControllerValidator(
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
    nameFieldControllerValidator = _nameFieldControllerValidator;
    descriptionFieldControllerValidator = _descriptionFieldControllerValidator;
    saveToCollectionModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldController?.dispose();

    saveToCollectionModel.dispose();
  }
}
