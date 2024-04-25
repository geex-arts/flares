import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'alert_dialog_cancel_collection_model.dart';
export 'alert_dialog_cancel_collection_model.dart';

class AlertDialogCancelCollectionWidget extends StatefulWidget {
  const AlertDialogCancelCollectionWidget({
    super.key,
    required this.title,
    this.savedWish,
  });

  final String? title;
  final WishesRow? savedWish;

  @override
  State<AlertDialogCancelCollectionWidget> createState() =>
      _AlertDialogCancelCollectionWidgetState();
}

class _AlertDialogCancelCollectionWidgetState
    extends State<AlertDialogCancelCollectionWidget> {
  late AlertDialogCancelCollectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertDialogCancelCollectionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ALERT_DIALOG_CANCEL_COLLECTION_alertDial');
      logFirebaseEvent('alertDialogCancelCollection_start_period');
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          if (_model.currentSecond == 0) {
            logFirebaseEvent('alertDialogCancelCollection_stop_periodi');
            _model.instantTimer?.cancel();
            logFirebaseEvent('alertDialogCancelCollection_dismiss_dial');
            Navigator.pop(context);
            return;
          }
          logFirebaseEvent('alertDialogCancelCollection_update_compo');
          setState(() {
            _model.currentSecond = _model.currentSecond + -1;
          });
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 47.0, 16.0, 0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 16.0,
              sigmaY: 16.0,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0x14FFFFFF),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Container(
                          width: 33.0,
                          height: 33.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                        ),
                        CircularPercentIndicator(
                          percent: valueOrDefault<double>(
                            _model.currentSecond / 3,
                            1.0,
                          ),
                          radius: 22.0,
                          lineWidth: 2.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          backgroundColor: const Color(0x00FFFFFF),
                          center: Text(
                            _model.currentSecond.toString(),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Nuckle',
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                  lineHeight: 0.8,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Text(
                          'Saved To The ${widget.title} Compilation',
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'ALERT_DIALOG_CANCEL_COLLECTION_UNDO_BTN_');
                        logFirebaseEvent('Button_stop_periodic_action');
                        _model.instantTimer?.cancel();
                        logFirebaseEvent('Button_dismiss_dialog');
                        Navigator.pop(context);
                      },
                      text: 'Undo',
                      options: FFButtonOptions(
                        width: 52.0,
                        height: 32.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).pinkButton,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nuckle',
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                  lineHeight: 1.3,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
