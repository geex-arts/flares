import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'create_couple_profile_model.dart';
export 'create_couple_profile_model.dart';

class CreateCoupleProfileWidget extends StatefulWidget {
  const CreateCoupleProfileWidget({super.key});

  @override
  State<CreateCoupleProfileWidget> createState() =>
      _CreateCoupleProfileWidgetState();
}

class _CreateCoupleProfileWidgetState extends State<CreateCoupleProfileWidget>
    with TickerProviderStateMixin {
  late CreateCoupleProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'stackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateCoupleProfileModel());

    _model.namesFieldController ??= TextEditingController();
    _model.namesFieldFocusNode ??= FocusNode();

    _model.sinceFieldController ??= TextEditingController();
    _model.sinceFieldFocusNode ??= FocusNode();
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
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
                  child: SizedBox(
                    height: 38.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0x9A000000),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 0.0),
                              child: Text(
                                'Create Couple',
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
                            context.safePop();
                          },
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            children: [
                              Container(
                                width: 38.0,
                                height: 38.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x9A000000),
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                    color: const Color(0x33FFFFFF),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 16.0,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 100.0,
                          child: Stack(
                            children: [
                              Container(
                                width: 120.0,
                                height: 120.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/images/Profile.webp',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 1.0),
                                child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD886B1),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x19FFFFFF),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextFormField(
                                  controller: _model.namesFieldController,
                                  focusNode: _model.namesFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Tomas & Lolita',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: const Color(0x98FFFFFF),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 8.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  minLines: null,
                                  validator: _model
                                      .namesFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 26.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Since when you together',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: const Color(0x19FFFFFF),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextFormField(
                                  controller: _model.sinceFieldController,
                                  focusNode: _model.sinceFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'dd / mm / yyyy',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: const Color(0x99FFFFFF),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 8.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  minLines: null,
                                  validator: _model
                                      .sinceFieldControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 28.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('Invite_Partner');
                          },
                          text: 'Create Couple',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).pinkButton,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Nuckle',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ]
                        .addToStart(const SizedBox(height: 25.0))
                        .addToEnd(const SizedBox(height: 40.0)),
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
