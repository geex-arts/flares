import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget>
    with TickerProviderStateMixin {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Privacy_Policy'});
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
        body: Container(
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
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
                                'Privacy Policy',
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
                                'PRIVACY_POLICY_PAGE_NavBack_ON_TAP');
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
                                  borderRadius: BorderRadius.circular(14.0),
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
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: 82.0,
                            height: 82.0,
                            decoration: BoxDecoration(
                              color: Color(0x18FFFFFF),
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Icon(
                              FFIcons.kguard,
                              color: FlutterFlowTheme.of(context).info,
                              size: 30.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 18.0, 0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x0DF2F1F3),
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 16.0, 10.0, 14.0),
                              child: Text(
                                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium laudantium, totam rem aperiam, eaque quae ab illo inventore veritatis quasi architecto beatae vitae dicta sunt\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium laudantium, totam rem\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium laudantium, totam rem aperiam, eaque quae ab illo inventore veritati\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium laudantium, totam rem aperiam, eaque quae ab illo inventore veritatis quasi architecto beatae vitae dicta sunt\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium laudantium, totam rem\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium laudantium, totam rem\n\nSed ut perspiciatis unde omnis iste natus',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nuckle',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                      lineHeight: 1.4,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ].addToEnd(SizedBox(height: 80.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
