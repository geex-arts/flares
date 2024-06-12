import '/backend/api_requests/api_calls.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_a_i_wishlist/b_s_a_i_wishlist_widget.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'b_s_budget_location_model.dart';
export 'b_s_budget_location_model.dart';

class BSBudgetLocationWidget extends StatefulWidget {
  const BSBudgetLocationWidget({
    super.key,
    required this.selectedCategories,
  });

  final String? selectedCategories;

  @override
  State<BSBudgetLocationWidget> createState() => _BSBudgetLocationWidgetState();
}

class _BSBudgetLocationWidgetState extends State<BSBudgetLocationWidget> {
  late BSBudgetLocationModel _model;

  bool textFieldFocusListenerRegistered = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSBudgetLocationModel());

    _model.textController ??= TextEditingController();
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
          sigmaX: 70.0,
          sigmaY: 70.0,
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
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: SearchCitiesCall.call(
                            searchString: _model.textController.text,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitPulse(
                                    color:
                                        FlutterFlowTheme.of(context).pinkButton,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            final textFieldSearchCitiesResponse =
                                snapshot.data!;
                            return Autocomplete<String>(
                              initialValue: const TextEditingValue(),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return (getJsonField(
                                  textFieldSearchCitiesResponse.jsonBody,
                                  r'''$..city''',
                                  true,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()
                                    .where((option) {
                                  final lowercaseOption = option.toLowerCase();
                                  return lowercaseOption.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return AutocompleteOptionsList(
                                  textFieldKey: _model.textFieldKey,
                                  textController: _model.textController!,
                                  options: options.toList(),
                                  onSelected: onSelected,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  textHighlightStyle:
                                      FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                  elevation: 0.0,
                                  optionBackgroundColor: const Color(0xFF1D1B1B),
                                  optionHighlightColor: const Color(0xFF1D1B1B),
                                  maxHeight: 230.0,
                                );
                              },
                              onSelected: (String selection) {
                                setState(() =>
                                    _model.textFieldSelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                _model.textFieldFocusNode = focusNode;
                                if (!textFieldFocusListenerRegistered) {
                                  textFieldFocusListenerRegistered = true;
                                  _model.textFieldFocusNode!
                                      .addListener(() => setState(() {}));
                                }
                                _model.textController = textEditingController;
                                return TextFormField(
                                  key: _model.textFieldKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    const Duration(milliseconds: 200),
                                    () => setState(() {}),
                                  ),
                                  autofocus: false,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    hintText: 'Search for a city...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: const Color(0x98FFFFFF),
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    errorStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
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
                                        color: FlutterFlowTheme.of(context)
                                            .pinkButton,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFF1D1B1B),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            40.0, 0.0, 20.0, 0.0),
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Color(0xCDFFFFFF),
                                    ),
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
                                  cursorColor:
                                      FlutterFlowTheme.of(context).pinkButton,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                );
                              },
                            );
                          },
                        ),
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
                    child: SizedBox(
                      height: 65.0,
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 4.0, 0.0),
                            child: LinearPercentIndicator(
                              percent: () {
                                if (_model.budget == 'moderate') {
                                  return 0.5;
                                } else if (_model.budget == 'friendly') {
                                  return 0.0;
                                } else {
                                  return 1.0;
                                }
                              }(),
                              lineHeight: 8.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: FlutterFlowTheme.of(context).pink,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).pinkButton,
                              barRadius: const Radius.circular(114.0),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Opacity(
                                opacity:
                                    _model.budget == 'friendly' ? 1.0 : 0.0,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'B_S_BUDGET_LOCATION_Column_vwj4tyc2_ON_T');
                                    logFirebaseEvent(
                                        'Column_update_component_state');
                                    _model.budget = 'friendly';
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 29.0,
                                        height: 11.0,
                                        decoration: const BoxDecoration(),
                                      ),
                                      Container(
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
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/slide.webp',
                                          width: 29.0,
                                          height: 11.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity:
                                    _model.budget == 'moderate' ? 1.0 : 0.0,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'B_S_BUDGET_LOCATION_Column_gcx7xadz_ON_T');
                                    logFirebaseEvent(
                                        'Column_update_component_state');
                                    _model.budget = 'moderate';
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 29.0,
                                        height: 11.0,
                                        decoration: const BoxDecoration(),
                                      ),
                                      Container(
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
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/slide.webp',
                                          width: 29.0,
                                          height: 11.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Opacity(
                                opacity: _model.budget == 'luxury' ? 1.0 : 0.0,
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'B_S_BUDGET_LOCATION_Column_oxar3rdl_ON_T');
                                    logFirebaseEvent(
                                        'Column_update_component_state');
                                    _model.budget = 'luxury';
                                    setState(() {});
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 29.0,
                                        height: 11.0,
                                        decoration: const BoxDecoration(),
                                      ),
                                      Container(
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
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/slide.webp',
                                          width: 29.0,
                                          height: 11.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'B_S_BUDGET_LOCATION_Text_64xf91pa_ON_TAP');
                                        logFirebaseEvent(
                                            'Text_update_component_state');
                                        _model.budget = 'friendly';
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Friendly',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'B_S_BUDGET_LOCATION_Text_mu2edy3j_ON_TAP');
                                        logFirebaseEvent(
                                            'Text_update_component_state');
                                        _model.budget = 'moderate';
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Moderate',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'B_S_BUDGET_LOCATION_Text_42rbkjmv_ON_TAP');
                                        logFirebaseEvent(
                                            'Text_update_component_state');
                                        _model.budget = 'luxury';
                                        setState(() {});
                                      },
                                      child: Text(
                                        'Luxury',
                                        textAlign: TextAlign.end,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
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
              ),
              Builder(
                builder: (context) => Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 45.0),
                  child: wrapWithModel(
                    model: _model.generateModel,
                    updateCallback: () => setState(() {}),
                    child: PinkButtonWidget(
                      text: '⚡️ Generate with AI',
                      currentAction: () async {
                        logFirebaseEvent(
                            'B_S_BUDGET_LOCATION_Generate_CALLBACK');
                        if ((_model.textController.text != '') ||
                            (_model.textFieldSelectedOption != null &&
                                _model.textFieldSelectedOption != '')) {
                          logFirebaseEvent('Generate_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('Generate_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.8,
                                    child: BSAIWishlistWidget(
                                      categories: widget.selectedCategories!,
                                      city: _model.textController.text != ''
                                          ? _model.textController.text
                                          : _model.textFieldSelectedOption!,
                                      budget: _model.budget,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        } else {
                          logFirebaseEvent('Generate_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, -1.0)
                                    .resolve(Directionality.of(context)),
                                child: const WebViewAware(
                                  child: AlertDialogWarningWidget(
                                    title: 'City not selected !',
                                    subtitle:
                                        'Please select from the list or enter your city name',
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        }
                      },
                    ),
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
