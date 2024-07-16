import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/notifications_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget>
    with TickerProviderStateMixin {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Notifications'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NOTIFICATIONS_Notifications_ON_INIT_STAT');
      logFirebaseEvent('Notifications_backend_call');
      unawaited(
        () async {
          await UsersTable().update(
            data: {
              'notifications_last_visited':
                  supaSerialize<DateTime>(getCurrentTimestamp),
            },
            matchingRows: (rows) => rows.eq(
              'id',
              currentUserUid,
            ),
          );
        }(),
      );
    });

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FutureBuilder<List<NotificationsRow>>(
          future: NotificationsTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'to_user',
                  currentUserUid,
                )
                .order('created_at'),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitPulse(
                    color: FlutterFlowTheme.of(context).pinkButton,
                    size: 50.0,
                  ),
                ),
              );
            }
            List<NotificationsRow> backgroundContainerNotificationsRowList =
                snapshot.data!;

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Background.webp',
                  ).image,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 47.0, 0.0, 0.0),
                          child: Container(
                            height: 38.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x9A000000),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 4.0, 8.0, 0.0),
                                      child: Text(
                                        'Notification',
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Nuckle',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'NOTIFICATIONS_PAGE_NavBack_ON_TAP');
                                    logFirebaseEvent('NavBack_navigate_back');
                                    context.safePop();
                                  },
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Container(
                                        width: 38.0,
                                        height: 38.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x9A000000),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          border: Border.all(
                                            color: Color(0x33FFFFFF),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['stackOnPageLoadAnimation']!),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.notificationsListModel1,
                                    updateCallback: () => setState(() {}),
                                    child: NotificationsListWidget(
                                      day: 'Today',
                                      parameter8:
                                          backgroundContainerNotificationsRowList
                                              .where((e) =>
                                                  functions
                                                      .checkDay(e.createdAt!) ==
                                                  'today')
                                              .toList(),
                                    ),
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.notificationsListModel2,
                                  updateCallback: () => setState(() {}),
                                  child: NotificationsListWidget(
                                    parameter8:
                                        backgroundContainerNotificationsRowList
                                            .where((e) =>
                                                functions
                                                    .checkDay(e.createdAt!) ==
                                                'yesterday')
                                            .toList(),
                                    day: 'Yesterday',
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: wrapWithModel(
                                    model: _model.notificationsListModel3,
                                    updateCallback: () => setState(() {}),
                                    child: NotificationsListWidget(
                                      day: 'Long time ago',
                                      parameter8:
                                          backgroundContainerNotificationsRowList
                                              .where((e) =>
                                                  functions
                                                      .checkDay(e.createdAt!) ==
                                                  'old')
                                              .toList(),
                                    ),
                                  ),
                                ),
                              ].addToEnd(SizedBox(height: 120.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: 120.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            FlutterFlowTheme.of(context).primaryBackground
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                    ),
                  ),
                  if (backgroundContainerNotificationsRowList.length < 1)
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 224.0,
                        height: 145.0,
                        decoration: BoxDecoration(
                          color: Color(0x0EFFFFFF),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.find_in_page_outlined,
                              color: FlutterFlowTheme.of(context).info,
                              size: 36.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'No data',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nuckle',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Your notifications \nwill appear here',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nuckle',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
