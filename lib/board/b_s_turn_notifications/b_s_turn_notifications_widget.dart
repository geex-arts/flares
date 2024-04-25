import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'b_s_turn_notifications_model.dart';
export 'b_s_turn_notifications_model.dart';

class BSTurnNotificationsWidget extends StatefulWidget {
  const BSTurnNotificationsWidget({super.key});

  @override
  State<BSTurnNotificationsWidget> createState() =>
      _BSTurnNotificationsWidgetState();
}

class _BSTurnNotificationsWidgetState extends State<BSTurnNotificationsWidget> {
  late BSTurnNotificationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSTurnNotificationsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 70.0,
          sigmaY: 70.0,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x18F2F1F3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Container(
                    width: 33.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: Color(0x3AF2F1F3),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 12.0),
                  child: Text(
                    'Never miss an update',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nuckle',
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Color(0x0CF2F1F3),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0x14FFFFFF),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 33.0,
                                  height: 33.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/logoRound.png',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Invitation to Collaborate💖',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Nuckle',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Now',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Text(
                                            'Sarah Smith has invited you to collaborate on \"New Apartment\"',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  color: Color(0x99FFFFFF),
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/bsimg.png',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: Text(
                          'Turn on push notifications to hear from\nfriends and get updates about your favorite products.',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                    lineHeight: 1.4,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 17.0, 16.0, 0.0),
                        child: wrapWithModel(
                          model: _model.turnOnNotificationsModel,
                          updateCallback: () => setState(() {}),
                          child: PinkButtonWidget(
                            text: 'Turn On Notifications',
                            currentAction: () async {
                              logFirebaseEvent(
                                  'B_S_TURN_NOTIFICATIONS_TurnOnNotificatio');
                              logFirebaseEvent(
                                  'TurnOnNotifications_request_permissions');
                              await requestPermission(notificationsPermission);
                              if (await getPermissionStatus(
                                  notificationsPermission)) {
                                logFirebaseEvent(
                                    'TurnOnNotifications_backend_call');
                                unawaited(
                                  () async {
                                    await UsersTable().update(
                                      data: {
                                        'push_partner_updates': true,
                                        'push_relationship_reminders': true,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        currentUserUid,
                                      ),
                                    );
                                  }(),
                                );
                              }
                              logFirebaseEvent(
                                  'TurnOnNotifications_bottom_sheet');
                              Navigator.pop(context);
                              logFirebaseEvent(
                                  'TurnOnNotifications_navigate_to');

                              context.goNamed('My_Profile');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 45.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'B_S_TURN_NOTIFICATIONS_RemindMeLater_ON_');
                            logFirebaseEvent('RemindMeLater_bottom_sheet');
                            Navigator.pop(context);
                            logFirebaseEvent('RemindMeLater_navigate_to');

                            context.goNamed('My_Profile');
                          },
                          text: 'Remind Me Later',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0x25FFFFFF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
