import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/wishlist/b_s_a_i_loader/b_s_a_i_loader_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'b_s_budget_location_model.dart';
export 'b_s_budget_location_model.dart';

class BSBudgetLocationWidget extends StatefulWidget {
  const BSBudgetLocationWidget({super.key});

  @override
  State<BSBudgetLocationWidget> createState() => _BSBudgetLocationWidgetState();
}

class _BSBudgetLocationWidgetState extends State<BSBudgetLocationWidget> {
  late BSBudgetLocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSBudgetLocationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16.0,
          sigmaY: 16.0,
        ),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
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
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  width: 33.0,
                  height: 4.0,
                  decoration: const BoxDecoration(
                    color: Color(0x3AF2F1F3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 12.0),
                child: Text(
                  'Name',
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
              const Divider(
                thickness: 1.0,
                color: Color(0x0CF2F1F3),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 26.0, 16.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Location',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Nuckle',
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(null),
                        options: const ['Option 1', 'Option 2', 'Option 3'],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: double.infinity,
                        height: 50.0,
                        maxHeight: 240.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Nuckle',
                                  color: const Color(0x99FFFFFF),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        hintText: 'Select an option',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: const Color(0xFF1D1B1B),
                        elevation: 0.0,
                        borderColor: Colors.transparent,
                        borderWidth: 0.0,
                        borderRadius: 30.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 14.0, 20.0, 14.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1.0,
                color: Color(0x0CF2F1F3),
              ),
              Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Select Location',
                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Nuckle',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0x1AFFFFFF),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      color: const Color(0x34FFFFFF),
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Friendly',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Text(
                              'Moderate',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                            Text(
                              'Luxury',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 14.0, 0.0, 0.0),
                          child: Stack(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            children: [
                              LinearPercentIndicator(
                                percent: 0.5,
                                lineHeight: 8.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).pink,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).pinkButton,
                                barRadius: const Radius.circular(114.0),
                                padding: EdgeInsets.zero,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Container(
                                        width: 26.0,
                                        height: 18.0,
                                        decoration: BoxDecoration(
                                          color:
                                              FlutterFlowTheme.of(context).pink,
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 26.0,
                                      height: 18.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).pink,
                                        borderRadius:
                                            BorderRadius.circular(9.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Container(
                                        width: 26.0,
                                        height: 18.0,
                                        decoration: BoxDecoration(
                                          color:
                                              FlutterFlowTheme.of(context).pink,
                                          borderRadius:
                                              BorderRadius.circular(9.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 2.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/slide.webp',
                                      width: 29.0,
                                      height: 11.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/slide.webp',
                                    width: 29.0,
                                    height: 11.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/slide.webp',
                                      width: 29.0,
                                      height: 11.0,
                                      fit: BoxFit.cover,
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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 45.0),
                child: wrapWithModel(
                  model: _model.generateModel,
                  updateCallback: () => setState(() {}),
                  child: PinkButtonWidget(
                    text: '⚡️ Generate with AI',
                    currentAction: () async {
                      Navigator.pop(context);
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return WebViewAware(
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                child: const BSAILoaderWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
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
