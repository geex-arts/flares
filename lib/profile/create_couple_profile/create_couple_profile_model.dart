import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_couple_profile_widget.dart' show CreateCoupleProfileWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateCoupleProfileModel
    extends FlutterFlowModel<CreateCoupleProfileWidget> {
  ///  Local state fields for this page.

  bool dateOn = false;

  bool borderColor = false;

  FFUploadedFile? uplImg;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Insert Row] action in Create_Couple_Profile widget.
  PairsRow? createdPairRow;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for NamesField widget.
  FocusNode? namesFieldFocusNode;
  TextEditingController? namesFieldTextController;
  String? Function(BuildContext, String?)? namesFieldTextControllerValidator;
  String? _namesFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Please enter at least 2 characters';
    }
    if (val.length > 40) {
      return 'Please enter maximum 40 characters';
    }

    return null;
  }

  DateTime? datePicked;
  // Model for CreateCouple.
  late PinkButtonModel createCoupleModel;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    namesFieldTextControllerValidator = _namesFieldTextControllerValidator;
    createCoupleModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    namesFieldFocusNode?.dispose();
    namesFieldTextController?.dispose();

    createCoupleModel.dispose();
  }
}
