import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'n_offer_widget.dart' show NOfferWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class NOfferModel extends FlutterFlowModel<NOfferWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Timer widget.
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(
    60000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for ContinueBtn.
  late PinkButtonModel continueBtnModel;
  // Stores action output result for [RevenueCat - Purchase] action in ContinueBtn widget.
  bool? result;

  @override
  void initState(BuildContext context) {
    continueBtnModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    continueBtnModel.dispose();
  }
}
