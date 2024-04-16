import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewPasswordModel());

    _model.passwordFieldTextController ??= TextEditingController();
    _model.passwordFieldFocusNode ??= FocusNode();
    _model.passwordFieldFocusNode!.addListener(() => setState(() {}));
    _model.rePasswordFieldTextController ??= TextEditingController();
    _model.rePasswordFieldFocusNode ??= FocusNode();
    _model.rePasswordFieldFocusNode!.addListener(() => setState(() {}));
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
                    controller: _model.passwordFieldTextController,
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
                                fontSize: 11.0,
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
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 14.0, 20.0, 14.0),
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
                    cursorColor: FlutterFlowTheme.of(context).pinkButton,
                    validator: _model.passwordFieldTextControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                    ],
                  ),
                ),
                if (_model.isWrongPassword)
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
                              'Password must have at least 8 characters, including letters and numbers.',
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
                    controller: _model.rePasswordFieldTextController,
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
                                fontSize: 11.0,
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
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 14.0, 20.0, 14.0),
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
                    cursorColor: FlutterFlowTheme.of(context).pinkButton,
                    validator: _model.rePasswordFieldTextControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                    ],
                  ),
                ),
                if (_model.isNotMatch)
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.info,
                          color: FlutterFlowTheme.of(context).info,
                          size: 16.0,
                        ),
                        Expanded(
                          child: Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Passwords do not match',
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
                        ),
                      ],
                    ),
                  ),
                Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 23.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.pinkButtonModel,
                      updateCallback: () => setState(() {}),
                      child: PinkButtonWidget(
                        text: 'Reset Password',
                        currentAction: () async {
                          var shouldSetState = false;
                          if ((_model.passwordFieldTextController.text ==
                                      '') ||
                              (_model.passwordFieldTextController.text.length <
                                  8)) {
                            setState(() {
                              _model.isWrongPassword = true;
                            });
                          } else if (_model.passwordFieldTextController.text !=
                              _model.rePasswordFieldTextController.text) {
                            setState(() {
                              _model.isNotMatch = true;
                            });
                          } else {
                            _model.isSuccess = await actions.changePassword(
                              _model.rePasswordFieldTextController.text,
                            );
                            shouldSetState = true;
                            if (_model.isSuccess!) {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(0.0, -1.0)
                                        .resolve(Directionality.of(context)),
                                    child: WebViewAware(
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: const AlertDialogWarningWidget(
                                          title: 'Success !',
                                          subtitle:
                                              'Your password has been changed successfully',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));

                              context.safePop();
                            } else {
                              showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(0.0, -1.0)
                                        .resolve(Directionality.of(context)),
                                    child: WebViewAware(
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: const AlertDialogWarningWidget(
                                          title: 'Something went wrong',
                                          subtitle: 'Please try again later',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));

                              if (shouldSetState) setState(() {});
                              return;
                            }
                          }

                          if (shouldSetState) setState(() {});
                        },
                      ),
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
