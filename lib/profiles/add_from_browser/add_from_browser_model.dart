import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_from_browser_widget.dart' show AddFromBrowserWidget;
import 'package:flutter/material.dart';

class AddFromBrowserModel extends FlutterFlowModel<AddFromBrowserWidget> {
  ///  Local state fields for this page.

  String? selectedImage;

  FFUploadedFile? uploadedFile;

  bool isBlocked = false;

  String? customUploadResult;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
      return 'Please enter below 30 characters';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Custom Action - uploadImageToSupabase] action in Container widget.
  String? result2;
  // Stores action output result for [Backend Call - Insert Row] action in Container widget.
  WishesRow? createdWishRowCopy;
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

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Model for SaveToCollection.
  late PinkButtonModel saveToCollectionModel;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Custom Action - uploadImageToSupabase] action in SaveToCollection widget.
  String? result;
  // Stores action output result for [Backend Call - Insert Row] action in SaveToCollection widget.
  WishesRow? createdWishRow;
  // Stores action output result for [Backend Call - Query Rows] action in SaveToCollection widget.
  List<CollectionsRow>? selectedCollection;
  // Stores action output result for [Backend Call - Update Row(s)] action in SaveToCollection widget.
  List<WishesRow>? updatedRow;
  // Model for SaveToCollection2.
  late PinkButtonModel saveToCollection2Model;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    descriptionFieldTextControllerValidator =
        _descriptionFieldTextControllerValidator;
    saveToCollectionModel = createModel(context, () => PinkButtonModel());
    saveToCollection2Model = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();

    saveToCollectionModel.dispose();
    saveToCollection2Model.dispose();
  }
}
