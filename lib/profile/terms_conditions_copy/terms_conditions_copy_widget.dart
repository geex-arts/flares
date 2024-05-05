import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'terms_conditions_copy_model.dart';
export 'terms_conditions_copy_model.dart';

class TermsConditionsCopyWidget extends StatefulWidget {
  const TermsConditionsCopyWidget({super.key});

  @override
  State<TermsConditionsCopyWidget> createState() =>
      _TermsConditionsCopyWidgetState();
}

class _TermsConditionsCopyWidgetState extends State<TermsConditionsCopyWidget>
    with TickerProviderStateMixin {
  late TermsConditionsCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsConditionsCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Terms_ConditionsCopy'});
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 47.0, 16.0, 0.0),
              child: SizedBox(
                height: 38.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 8.0, 0.0),
                          child: Text(
                            'Terms & Conditions',
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nuckle',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
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
                            'TERMS_CONDITIONS_COPY_NavBack_ON_TAP');
                        logFirebaseEvent('NavBack_navigate_back');
                        context.safePop();
                      },
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          Container(
                            width: 38.0,
                            height: 38.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          Icon(
                            Icons.chevron_left,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
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
            FlutterFlowWebView(
              content: 'https://flaresapp.com/privacy',
              bypass: false,
              height: MediaQuery.sizeOf(context).height * 1.0,
              verticalScroll: false,
              horizontalScroll: false,
            ),
          ],
        ),
      ),
    );
  }
}
