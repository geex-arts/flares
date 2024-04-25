import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'n_save_to_collection_model.dart';
export 'n_save_to_collection_model.dart';

class NSaveToCollectionWidget extends StatefulWidget {
  const NSaveToCollectionWidget({
    super.key,
    required this.selectedCollectionID,
  });

  final String? selectedCollectionID;

  @override
  State<NSaveToCollectionWidget> createState() =>
      _NSaveToCollectionWidgetState();
}

class _NSaveToCollectionWidgetState extends State<NSaveToCollectionWidget> {
  late NSaveToCollectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NSaveToCollectionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 70.0,
            sigmaY: 70.0,
          ),
          child: Container(
            width: 259.0,
            decoration: BoxDecoration(
              color: Color(0x16F2F1F3),
              borderRadius: BorderRadius.circular(32.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Are you sure you want to delete this colletion?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nuckle',
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                          lineHeight: 1.4,
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'N_SAVE_TO_COLLECTION_COMP_Allow_ON_TAP');
                        logFirebaseEvent('Allow_backend_call');
                        unawaited(
                          () async {
                            await CollectionsTable().delete(
                              matchingRows: (rows) => rows.eq(
                                'uuid',
                                widget.selectedCollectionID,
                              ),
                            );
                          }(),
                        );
                        logFirebaseEvent('Allow_update_app_state');
                        _model.updatePage(() {});
                        logFirebaseEvent('Allow_bottom_sheet');
                        Navigator.pop(context, true);
                      },
                      text: 'Delete Collection',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).pinkButton,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nuckle',
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                  lineHeight: 1.3,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'N_SAVE_TO_COLLECTION_DontAllow_ON_TAP');
                        logFirebaseEvent('DontAllow_bottom_sheet');
                        Navigator.pop(context, false);
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 100.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nuckle',
                                  color: Color(0x80F2F1F3),
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
