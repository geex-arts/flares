import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_couple_profile_model.dart';
export 'edit_couple_profile_model.dart';

class EditCoupleProfileWidget extends StatefulWidget {
  const EditCoupleProfileWidget({
    super.key,
    required this.myPairRow,
  });

  final PairsRow? myPairRow;

  @override
  State<EditCoupleProfileWidget> createState() =>
      _EditCoupleProfileWidgetState();
}

class _EditCoupleProfileWidgetState extends State<EditCoupleProfileWidget>
    with TickerProviderStateMixin {
  late EditCoupleProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCoupleProfileModel());

    _model.namesFieldTextController ??=
        TextEditingController(text: widget.myPairRow?.pairName);
    _model.namesFieldFocusNode ??= FocusNode();
    _model.namesFieldFocusNode!.addListener(() => setState(() {}));
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          child: Stack(
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
                            color: const Color(0x9A000000),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 0.0),
                            child: Text(
                              'Edit Couple Profile',
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
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 80.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: 100.0,
                            height: 100.0,
                            child: Stack(
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (_model.photoPS == null ||
                                        (_model.photoPS?.bytes?.isEmpty ??
                                            true)) {
                                      return Container(
                                        width: 120.0,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0x19FFFFFF),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              widget.myPairRow!.photo!,
                                            ).image,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        width: 120.0,
                                        height: 120.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.memory(
                                          _model.photoPS?.bytes ??
                                              Uint8List.fromList([]),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, 1.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedMedia =
                                          await selectMediaWithSourceBottomSheet(
                                        context: context,
                                        maxHeight: 360.00,
                                        imageQuality: 95,
                                        allowPhoto: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading1 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading1 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile1 =
                                                selectedUploadedFiles.first;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          setState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      if ((_model.uploadedLocalFile1.bytes
                                                  ?.isNotEmpty ??
                                              false)) {
                                        setState(() {
                                          _model.photoPS =
                                              _model.uploadedLocalFile1;
                                        });
                                      }
                                    },
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
                                        FFIcons.kgroup63449761,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
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
                                    0.0, 16.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.namesFieldTextController,
                                  focusNode: _model.namesFieldFocusNode,
                                  autofocus: false,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    hintText: 'Couple name',
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
                                    fillColor: const Color(0x0FFFFFFF),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 14.0, 20.0, 14.0),
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
                                  validator: _model
                                      .namesFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
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
                                    0.0, 16.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.dateOn = true;
                                      _model.borderOn = true;
                                    });
                                    await showModalBottomSheet<bool>(
                                        context: context,
                                        builder: (context) {
                                          final datePickedCupertinoTheme =
                                              CupertinoTheme.of(context);
                                          return ScrollConfiguration(
                                            behavior:
                                                const MaterialScrollBehavior()
                                                    .copyWith(
                                              dragDevices: {
                                                PointerDeviceKind.mouse,
                                                PointerDeviceKind.touch,
                                                PointerDeviceKind.stylus,
                                                PointerDeviceKind.unknown
                                              },
                                            ),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              child: CupertinoTheme(
                                                data: datePickedCupertinoTheme
                                                    .copyWith(
                                                  textTheme:
                                                      datePickedCupertinoTheme
                                                          .textTheme
                                                          .copyWith(
                                                    dateTimePickerTextStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nuckle',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                  ),
                                                ),
                                                child: CupertinoDatePicker(
                                                  mode: CupertinoDatePickerMode
                                                      .date,
                                                  minimumDate: DateTime(1900),
                                                  initialDateTime:
                                                      getCurrentTimestamp,
                                                  maximumDate:
                                                      getCurrentTimestamp,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  use24hFormat: false,
                                                  onDateTimeChanged:
                                                      (newDateTime) =>
                                                          safeSetState(() {
                                                    _model.datePicked =
                                                        newDateTime;
                                                  }),
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                    setState(() {
                                      _model.dateOn = false;
                                      _model.borderOn = false;
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: const Color(0x0FFFFFFF),
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                        color: _model.borderOn
                                            ? FlutterFlowTheme.of(context)
                                                .pinkButton
                                            : const Color(0x00000000),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 14.0, 20.0, 14.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.datePicked != null
                                              ? dateTimeFormat('dd / MM / yyyy',
                                                  _model.datePicked)
                                              : dateTimeFormat('dd / MM / yyyy',
                                                  widget.myPairRow?.pairSince),
                                          'dd / mm / yyyy',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color: const Color(0x98FFFFFF),
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                              lineHeight: 1.4,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Do you live with your partner?',
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
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController1 ??=
                                          FormFieldController<String>(null),
                                  options: const ['Option 1', 'Option 2', 'Option 3'],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue1 = val),
                                  width: double.infinity,
                                  height: 46.0,
                                  maxHeight: 240.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color: const Color(0x99FFFFFF),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: 'Select an option',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What\'s your relationship status?',
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
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController2 ??=
                                          FormFieldController<String>(null),
                                  options: const ['Option 1'],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue2 = val),
                                  width: double.infinity,
                                  height: 46.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color: const Color(0x9AFFFFFF),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: 'Select an option',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: const Color(0xFF1D1B1B),
                                  elevation: 0.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 30.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 26.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Do either of you have kids?',
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
                                child: FlutterFlowDropDown<String>(
                                  controller:
                                      _model.dropDownValueController3 ??=
                                          FormFieldController<String>(null),
                                  options: const ['Option 1'],
                                  onChanged: (val) => setState(
                                      () => _model.dropDownValue3 = val),
                                  width: double.infinity,
                                  height: 46.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color: const Color(0x98FFFFFF),
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                  hintText: 'Select an option',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: const Color(0xFF1D1B1B),
                                  elevation: 0.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 30.0,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]
                          .addToStart(const SizedBox(height: 25.0))
                          .addToEnd(const SizedBox(height: 120.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Builder(
                  builder: (context) => Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 45.0),
                    child: wrapWithModel(
                      model: _model.createCoupleModel,
                      updateCallback: () => setState(() {}),
                      child: PinkButtonWidget(
                        text: 'Save Changes',
                        currentAction: () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (_model.photoPS != null &&
                              (_model.photoPS?.bytes?.isNotEmpty ?? false)) {
                            {
                              setState(() => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedMedia = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles =
                                    _model.photoPS!.bytes!.isNotEmpty
                                        ? [_model.photoPS!]
                                        : <FFUploadedFile>[];
                                selectedMedia = selectedFilesFromUploadedFiles(
                                  selectedUploadedFiles,
                                  storageFolderPath: 'pairImages',
                                );
                                downloadUrls = await uploadSupabaseStorageFiles(
                                  bucketName: 'EdayBucket',
                                  selectedFiles: selectedMedia,
                                );
                              } finally {
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }
                          }
                          unawaited(
                            () async {
                              await PairsTable().update(
                                data: {
                                  'photo': _model.uploadedFileUrl2 != ''
                                      ? _model.uploadedFileUrl2
                                      : widget.myPairRow?.photo,
                                  'pair_name':
                                      _model.namesFieldTextController.text,
                                  'pair_since': supaSerialize<DateTime>(
                                      _model.datePicked ?? widget.myPairRow?.pairSince),
                                },
                                matchingRows: (rows) => rows.eq(
                                  'uuid',
                                  widget.myPairRow?.uuid,
                                ),
                              );
                            }(),
                          );
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
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: const AlertDialogWarningWidget(
                                      title: 'Data saved !',
                                      subtitle:
                                          'Your data was updated successfully',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          context.safePop();
                        },
                      ),
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
