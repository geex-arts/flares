import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_couple_profile_widget.dart' show EditCoupleProfileWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditCoupleProfileModel extends FlutterFlowModel<EditCoupleProfileWidget> {
  ///  Local state fields for this page.

  bool dateOn = false;

  bool borderOn = false;

  FFUploadedFile? photoPS;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for NamesField widget.
  FocusNode? namesFieldFocusNode;
  TextEditingController? namesFieldController;
  String? Function(BuildContext, String?)? namesFieldControllerValidator;
  String? _namesFieldControllerValidator(BuildContext context, String? val) {
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

  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Model for CreateCouple.
  late PinkButtonModel createCoupleModel;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    namesFieldControllerValidator = _namesFieldControllerValidator;
    createCoupleModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    namesFieldFocusNode?.dispose();
    namesFieldController?.dispose();

    createCoupleModel.dispose();
  }
}
