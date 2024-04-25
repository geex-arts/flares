import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'alert_dialog_cancel_collection_widget.dart'
    show AlertDialogCancelCollectionWidget;
import 'package:flutter/material.dart';

class AlertDialogCancelCollectionModel
    extends FlutterFlowModel<AlertDialogCancelCollectionWidget> {
  ///  Local state fields for this component.

  int currentSecond = 3;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
