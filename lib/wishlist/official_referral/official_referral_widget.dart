import '/components/pink_button_widget.dart';
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
import 'official_referral_model.dart';
export 'official_referral_model.dart';

class OfficialReferralWidget extends StatefulWidget {
  const OfficialReferralWidget({super.key});

  @override
  State<OfficialReferralWidget> createState() => _OfficialReferralWidgetState();
}

class _OfficialReferralWidgetState extends State<OfficialReferralWidget>
    with TickerProviderStateMixin {
  late OfficialReferralModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OfficialReferralModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Official_Referral'});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 47.0, 16.0, 0.0),
                child: Container(
                  height: 38.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'OFFICIAL_REFERRAL_PAGE_NavBack_ON_TAP');
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
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Official Referral',
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Nuckle',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                                lineHeight: 1.4,
                              ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Text(
                        'You can find the pairing code in\nthe message your partner sent \nyou.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nuckle',
                              color: Color(0x9AFFFFFF),
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                              lineHeight: 1.4,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 34.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 140.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Image.asset(
                                'assets/images/Vector_1.webp',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Container(
                                width: 134.0,
                                height: 134.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/Profile.webp',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    28.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 55.0,
                                  height: 55.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/pexels-ron-lach-9771805_3.webp',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 6.0, 28.0, 0.0),
                                child: Container(
                                  width: 62.0,
                                  height: 62.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    'assets/images/Mask_group.webp',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Text(
                        'Your referral code',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nuckle',
                              color: FlutterFlowTheme.of(context).info,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: Color(0x1AFFFFFF),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'r6g5d44f6',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).pinkButton,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.share_outlined,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 14.0,
                                        ),
                                        Text(
                                          'Share',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(height: 30.0))
                      .addToEnd(SizedBox(height: 60.0)),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 40.0),
                child: wrapWithModel(
                  model: _model.pinkButtonModel,
                  updateCallback: () => setState(() {}),
                  child: PinkButtonWidget(
                    text: 'Invite from Contacts',
                    currentAction: () async {},
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
