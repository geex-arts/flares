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
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for NamesField widget.
  FocusNode? namesFieldFocusNode;
  TextEditingController? namesFieldController;
  String? Function(BuildContext, String?)? namesFieldControllerValidator;
  DateTime? datePicked;
  // Model for CreateCouple.
  late PinkButtonModel createCoupleModel;

  @override
  void initState(BuildContext context) {
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
