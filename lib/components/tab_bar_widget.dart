import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tab_bar_model.dart';
export 'tab_bar_model.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    this.index,
  });

  final int? index;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  late TabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 16.0,
              sigmaY: 16.0,
            ),
            child: Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x1AFFFFFF),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'TAB_BAR_COMP_Container_9a1z6b86_ON_TAP');
                        if (widget.index == 0) {
                          logFirebaseEvent('Container_update_app_state');
                          _model.updatePage(() {});
                        } else {
                          logFirebaseEvent('Container_navigate_to');

                          context.goNamed('Explore');
                        }
                      },
                      child: Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: BoxDecoration(),
                        child: Icon(
                          FFIcons.kworld,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 18.0,
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
                            'TAB_BAR_COMP_Container_7ao3n5gl_ON_TAP');
                        if (widget.index == 1) {
                          logFirebaseEvent('Container_update_app_state');
                          _model.updatePage(() {});
                        } else {
                          logFirebaseEvent('Container_navigate_to');

                          context.pushNamed(
                            'Assistant_View',
                            queryParameters: {
                              'aiAssistantLink': serializeParam(
                                'https://flaresapp.com/chat?userID=$currentUserUid',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }
                      },
                      child: Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: BoxDecoration(),
                        child: Icon(
                          FFIcons.kgroup63448861,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 22.0,
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
                            'TAB_BAR_COMP_Container_99yc2qy1_ON_TAP');
                        if (widget.index != 2) {
                          logFirebaseEvent('Container_navigate_to');

                          context.goNamed('My_Profile');
                        } else {
                          logFirebaseEvent('Container_update_app_state');
                          _model.updatePage(() {});
                        }
                      },
                      child: Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            width: 22.0,
                            height: 22.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/prof3.webp',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
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
