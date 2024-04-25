import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'n_allow_notify_model.dart';
export 'n_allow_notify_model.dart';

class NAllowNotifyWidget extends StatefulWidget {
  const NAllowNotifyWidget({super.key});

  @override
  State<NAllowNotifyWidget> createState() => _NAllowNotifyWidgetState();
}

class _NAllowNotifyWidgetState extends State<NAllowNotifyWidget> {
  late NAllowNotifyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NAllowNotifyModel());
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
            sigmaX: 16.0,
            sigmaY: 16.0,
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
                    '\"MyApp\" Would Like to \nSend You Notifications',
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
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nuckle',
                            color: Color(0x99FFFFFF),
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                            lineHeight: 1.4,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('N_ALLOW_NOTIFY_COMP_Allow_ON_TAP');
                        logFirebaseEvent('Allow_request_permissions');
                        await requestPermission(notificationsPermission);
                        if (await getPermissionStatus(
                            notificationsPermission)) {
                          logFirebaseEvent('Allow_close_dialog,_drawer,_etc');
                          Navigator.pop(context);
                          logFirebaseEvent('Allow_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Permission is set !',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).pinkButton,
                            ),
                          );
                          logFirebaseEvent('Allow_navigate_to');

                          context.goNamed('My_Profile');
                        } else {
                          logFirebaseEvent('Allow_show_snack_bar');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Permission is not set !',
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).pinkButton,
                            ),
                          );
                        }
                      },
                      text: 'Allow',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).pinkButton,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nuckle',
                                  color: Colors.white,
                                  fontSize: 17.0,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'N_ALLOW_NOTIFY_COMP_DontAllow_ON_TAP');
                        logFirebaseEvent('DontAllow_close_dialog,_drawer,_etc');
                        Navigator.pop(context);
                        logFirebaseEvent('DontAllow_navigate_to');

                        context.pushNamed('My_Profile');
                      },
                      text: 'Don\'t Allow',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Nuckle',
                                  color: Color(0x80F2F1F3),
                                  fontSize: 17.0,
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
