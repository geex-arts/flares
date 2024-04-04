import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'new_password_model.dart';
export 'new_password_model.dart';

class NewPasswordWidget extends StatefulWidget {
  const NewPasswordWidget({super.key});

  @override
  State<NewPasswordWidget> createState() => _NewPasswordWidgetState();
}

class _NewPasswordWidgetState extends State<NewPasswordWidget>
    with TickerProviderStateMixin {
  late NewPasswordModel _model;

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
    _model = createModel(context, () => NewPasswordModel());

    _model.passwordFieldController ??= TextEditingController();
    _model.passwordFieldFocusNode ??= FocusNode();
    _model.passwordFieldFocusNode!.addListener(() => setState(() {}));
    _model.rePasswordFieldController ??= TextEditingController();
    _model.rePasswordFieldFocusNode ??= FocusNode();
    _model.rePasswordFieldFocusNode!.addListener(() => setState(() {}));
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
              mainAxisSize: MainAxisSize.max,
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
                                'New Password',
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.passwordFieldController,
                    focusNode: _model.passwordFieldFocusNode,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: !_model.passwordFieldVisibility,
                    decoration: InputDecoration(
                      isDense: false,
                      hintText: 'Password',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Nuckle',
                                color: const Color(0x98FFFFFF),
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      errorStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Nuckle',
                                color: FlutterFlowTheme.of(context).error,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).pinkButton,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: const Color(0x0FFFFFFF),
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => _model.passwordFieldVisibility =
                              !_model.passwordFieldVisibility,
                        ),
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _model.passwordFieldVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0x98FFFFFF),
                          size: 18.0,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nuckle',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    minLines: null,
                    cursorColor: FlutterFlowTheme.of(context).pinkButton,
                    validator: _model.passwordFieldControllerValidator
                        .asValidator(context),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info,
                          color: FlutterFlowTheme.of(context).info,
                          size: 16.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Password must have 8 characters, including letters and numbers.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: const Color(0x7FFFFFFF),
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.rePasswordFieldController,
                    focusNode: _model.rePasswordFieldFocusNode,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    obscureText: !_model.rePasswordFieldVisibility,
                    decoration: InputDecoration(
                      isDense: false,
                      hintText: 'Repeat password',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                fontFamily: 'Nuckle',
                                color: const Color(0x98FFFFFF),
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      errorStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Nuckle',
                                color: FlutterFlowTheme.of(context).error,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).pinkButton,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: const Color(0x0FFFFFFF),
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      suffixIcon: InkWell(
                        onTap: () => setState(
                          () => _model.rePasswordFieldVisibility =
                              !_model.rePasswordFieldVisibility,
                        ),
                        focusNode: FocusNode(skipTraversal: true),
                        child: Icon(
                          _model.rePasswordFieldVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: const Color(0x98FFFFFF),
                          size: 18.0,
                        ),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nuckle',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    minLines: null,
                    cursorColor: FlutterFlowTheme.of(context).pinkButton,
                    validator: _model.rePasswordFieldControllerValidator
                        .asValidator(context),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info,
                          color: FlutterFlowTheme.of(context).info,
                          size: 16.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Password must have 8 characters, including letters and numbers.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: const Color(0x7FFFFFFF),
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.pinkButtonModel,
                    updateCallback: () => setState(() {}),
                    child: PinkButtonWidget(
                      text: 'Reset Password',
                      currentAction: () async {
                        await UsersTable().update(
                          data: {
                            'email': _model.rePasswordFieldController.text,
                          },
                          matchingRows: (rows) => rows,
                        );

                        context.pushNamed('My_Profile');
                      },
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
