import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/wishlist/b_s_new_collection/b_s_new_collection_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_from_browser_model.dart';
export 'add_from_browser_model.dart';

class AddFromBrowserWidget extends StatefulWidget {
  const AddFromBrowserWidget({
    super.key,
    this.url,
  });

  final String? url;

  @override
  State<AddFromBrowserWidget> createState() => _AddFromBrowserWidgetState();
}

class _AddFromBrowserWidgetState extends State<AddFromBrowserWidget> {
  late AddFromBrowserModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFromBrowserModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'addFromBrowser'});

    _model.nameFieldFocusNode ??= FocusNode();

    _model.descriptionFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background.webp',
              ).image,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
            child: ClipRRect(
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
                child: FutureBuilder<ApiCallResponse>(
                  future: ParseSiteCall.call(
                    url: widget.url,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitPulse(
                            color: FlutterFlowTheme.of(context).pinkButton,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    final containerParseSiteResponse = snapshot.data!;

                    return Container(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Container(
                                width: 33.0,
                                height: 4.0,
                                decoration: const BoxDecoration(
                                  color: Color(0x3AF2F1F3),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 14.0, 0.0, 12.0),
                              child: Text(
                                'Add to wishlist',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nuckle',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: Color(0x0CF2F1F3),
                          ),
                          Expanded(
                            child: Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 24.0, 16.0, 0.0),
                                      child: Text(
                                        'Name',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.nameFieldTextController ??=
                                                TextEditingController(
                                          text: (String var1) {
                                            return var1.length > 30
                                                ? var1.substring(0, 30)
                                                : var1;
                                          }(getJsonField(
                                            containerParseSiteResponse.jsonBody,
                                            r'''$.title''',
                                          ).toString()),
                                        ),
                                        focusNode: _model.nameFieldFocusNode,
                                        autofocus: false,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          hintText: 'Name',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nuckle',
                                                    color: const Color(0x98FFFFFF),
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .pinkButton,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0x0FFFFFFF),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 13.0, 20.0, 13.0),
                                        ),
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
                                        maxLength: 30,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .pinkButton,
                                        validator: _model
                                            .nameFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 30.0, 0.0, 0.0),
                                      child: Text(
                                        'Collection',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child:
                                          FutureBuilder<List<CollectionsRow>>(
                                        future: CollectionsTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'pair',
                                                FFAppState().pairID,
                                              )
                                              .order('name', ascending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitPulse(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .pinkButton,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<CollectionsRow>
                                              blurCollectionsRowList =
                                              snapshot.data!;

                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 16.0,
                                                sigmaY: 16.0,
                                              ),
                                              child: Container(
                                                height: 50.0,
                                                decoration: const BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .dropDownValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model.dropDownValue ??=
                                                              '',
                                                        ),
                                                        options: List<
                                                                String>.from(
                                                            blurCollectionsRowList.isNotEmpty
                                                                ? blurCollectionsRowList
                                                                    .map((e) =>
                                                                        e.uuid)
                                                                    .toList()
                                                                : ([])),
                                                        optionLabels:
                                                            blurCollectionsRowList.isNotEmpty
                                                                ? blurCollectionsRowList
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .withoutNulls
                                                                    .toList()
                                                                : ([]),
                                                        onChanged: (val) =>
                                                            setState(() => _model
                                                                    .dropDownValue =
                                                                val),
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nuckle',
                                                                  color: const Color(
                                                                      0x99FFFFFF),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        hintText:
                                                            'Collection name',
                                                        icon: const Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color:
                                                              Color(0x80F2F1F3),
                                                          size: 20.0,
                                                        ),
                                                        fillColor:
                                                            const Color(0xFF1D1B1B),
                                                        elevation: 0.0,
                                                        borderColor:
                                                            const Color(0x0FFFFFFF),
                                                        borderWidth: 0.0,
                                                        borderRadius: 30.0,
                                                        margin:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                    Builder(
                                                      builder: (context) =>
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            const Color(0x004B39EF),
                                                        borderRadius: 12.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 46.0,
                                                        fillColor:
                                                            const Color(0x2AFFFFFF),
                                                        disabledColor:
                                                            const Color(0x2AFFFFFF),
                                                        disabledIconColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        icon: Icon(
                                                          FFIcons.kaddCircle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          size: 22.0,
                                                        ),
                                                        showLoadingIndicator:
                                                            true,
                                                        onPressed:
                                                            _model.isBlocked
                                                                ? null
                                                                : () async {
                                                                    logFirebaseEvent(
                                                                        'ADD_FROM_BROWSER_addCircle_ICN_ON_TAP');
                                                                    var shouldSetState =
                                                                        false;
                                                                    logFirebaseEvent(
                                                                        'IconButton_validate_form');
                                                                    if (_model.formKey.currentState ==
                                                                            null ||
                                                                        !_model
                                                                            .formKey
                                                                            .currentState!
                                                                            .validate()) {
                                                                      return;
                                                                    }
                                                                    logFirebaseEvent(
                                                                        'IconButton_update_page_state');
                                                                    _model.isBlocked =
                                                                        true;
                                                                    setState(
                                                                        () {});
                                                                    if (true) {
                                                                      if ((_model.selectedImage == null ||
                                                                              _model.selectedImage ==
                                                                                  '') &&
                                                                          (_model.uploadedFile != null &&
                                                                              (_model.uploadedFile?.bytes?.isNotEmpty ??
                                                                                  false))) {
                                                                        logFirebaseEvent(
                                                                            'IconButton_upload_file_to_supabase');
                                                                        {
                                                                          setState(() =>
                                                                              _model.isDataUploading1 = true);
                                                                          var selectedUploadedFiles =
                                                                              <FFUploadedFile>[];
                                                                          var selectedFiles =
                                                                              <SelectedFile>[];
                                                                          var downloadUrls =
                                                                              <String>[];
                                                                          try {
                                                                            selectedUploadedFiles = _model.uploadedFile!.bytes!.isNotEmpty
                                                                                ? [
                                                                                    _model.uploadedFile!
                                                                                  ]
                                                                                : <FFUploadedFile>[];
                                                                            selectedFiles =
                                                                                selectedFilesFromUploadedFiles(
                                                                              selectedUploadedFiles,
                                                                              storageFolderPath: 'wishImages',
                                                                            );
                                                                            downloadUrls =
                                                                                await uploadSupabaseStorageFiles(
                                                                              bucketName: 'EdayBucket',
                                                                              selectedFiles: selectedFiles,
                                                                            );
                                                                          } finally {
                                                                            _model.isDataUploading1 =
                                                                                false;
                                                                          }
                                                                          if (selectedUploadedFiles.length == selectedFiles.length &&
                                                                              downloadUrls.length == selectedFiles.length) {
                                                                            setState(() {
                                                                              _model.uploadedLocalFile1 = selectedUploadedFiles.first;
                                                                              _model.uploadedFileUrl1 = downloadUrls.first;
                                                                            });
                                                                          } else {
                                                                            setState(() {});
                                                                            return;
                                                                          }
                                                                        }
                                                                      } else if (_model.selectedImage !=
                                                                              null &&
                                                                          _model.selectedImage !=
                                                                              '') {
                                                                        logFirebaseEvent(
                                                                            'IconButton_custom_action');
                                                                        _model.result2 =
                                                                            await actions.uploadImageToSupabase(
                                                                          _model
                                                                              .selectedImage!,
                                                                        );
                                                                        shouldSetState =
                                                                            true;
                                                                        if (_model.result2 !=
                                                                                null &&
                                                                            _model.result2 !=
                                                                                '') {
                                                                          logFirebaseEvent(
                                                                              'IconButton_update_page_state');
                                                                          _model.customUploadResult =
                                                                              _model.result2;
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'IconButton_update_page_state');
                                                                          _model.isBlocked =
                                                                              false;
                                                                          setState(
                                                                              () {});
                                                                          logFirebaseEvent(
                                                                              'IconButton_alert_dialog');
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: const AlignmentDirectional(0.0, -1.0).resolve(Directionality.of(context)),
                                                                                child: WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                    child: const AlertDialogWarningWidget(
                                                                                      title: 'Error !',
                                                                                      subtitle: 'There was an error uploading the image. Please try again later.',
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ).then((value) =>
                                                                              setState(() {}));

                                                                          if (shouldSetState) {
                                                                            setState(() {});
                                                                          }
                                                                          return;
                                                                        }
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'IconButton_update_page_state');
                                                                        _model.isBlocked =
                                                                            false;
                                                                        setState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'IconButton_alert_dialog');
                                                                        showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: const AlignmentDirectional(0.0, -1.0).resolve(Directionality.of(context)),
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: const AlertDialogWarningWidget(
                                                                                    title: 'No image selected!',
                                                                                    subtitle: 'Please select the image from the list below or upload your own',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));

                                                                        if (shouldSetState) {
                                                                          setState(
                                                                              () {});
                                                                        }
                                                                        return;
                                                                      }

                                                                      logFirebaseEvent(
                                                                          'IconButton_backend_call');
                                                                      _model.createdWishRowCopy =
                                                                          await WishesTable()
                                                                              .insert({
                                                                        'visibily':
                                                                            true,
                                                                        'collection': _model.dropDownValue != null &&
                                                                                _model.dropDownValue != ''
                                                                            ? _model.dropDownValue
                                                                            : null,
                                                                        'pair':
                                                                            FFAppState().pairID,
                                                                        'created_by':
                                                                            currentUserUid,
                                                                        'name': _model
                                                                            .nameFieldTextController
                                                                            .text,
                                                                        'description': _model
                                                                            .descriptionFieldTextController
                                                                            .text,
                                                                        'photo':
                                                                            () {
                                                                          if ((_model.selectedImage != null && _model.selectedImage != '') &&
                                                                              (_model.customUploadResult != null && _model.customUploadResult != '')) {
                                                                            return _model.customUploadResult;
                                                                          } else if (_model.selectedImage != null && _model.selectedImage != '') {
                                                                            return _model.selectedImage;
                                                                          } else {
                                                                            return _model.uploadedFileUrl1;
                                                                          }
                                                                        }(),
                                                                        'link':
                                                                            getJsonField(
                                                                          containerParseSiteResponse
                                                                              .jsonBody,
                                                                          r'''$.link''',
                                                                        ).toString(),
                                                                      });
                                                                      shouldSetState =
                                                                          true;
                                                                      logFirebaseEvent(
                                                                          'IconButton_bottom_sheet');
                                                                      Navigator.pop(
                                                                          context);
                                                                      logFirebaseEvent(
                                                                          'IconButton_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        isDismissible:
                                                                            false,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: SizedBox(
                                                                                  height: MediaQuery.sizeOf(context).height * 0.65,
                                                                                  child: BSNewCollectionWidget(
                                                                                    selectedWishRow: _model.createdWishRowCopy,
                                                                                    isFromBrowser: true,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    }
                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 6.0)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 30.0, 0.0, 0.0),
                                      child: Text(
                                        'Motivation',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 0.0),
                                      child: TextFormField(
                                        controller: _model
                                                .descriptionFieldTextController ??=
                                            TextEditingController(
                                          text: getJsonField(
                                                    containerParseSiteResponse
                                                        .jsonBody,
                                                    r'''$.description''',
                                                  ) !=
                                                  null
                                              ? getJsonField(
                                                  containerParseSiteResponse
                                                      .jsonBody,
                                                  r'''$.description''',
                                                ).toString()
                                              : '',
                                        ),
                                        focusNode:
                                            _model.descriptionFieldFocusNode,
                                        autofocus: false,
                                        textInputAction: TextInputAction.next,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          hintText: 'Description',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Nuckle',
                                                    color: const Color(0x98FFFFFF),
                                                    letterSpacing: 0.0,
                                                    useGoogleFonts: false,
                                                  ),
                                          errorStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .pinkButton,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          filled: true,
                                          fillColor: const Color(0x0FFFFFFF),
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 16.0, 20.0, 16.0),
                                        ),
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
                                        maxLines: 5,
                                        minLines: 5,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .pinkButton,
                                        validator: _model
                                            .descriptionFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 30.0, 0.0, 0.0),
                                      child: Text(
                                        'Select Image',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        height: 177.0,
                                        decoration: const BoxDecoration(),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (getJsonField(
                                                    containerParseSiteResponse
                                                        .jsonBody,
                                                    r'''$.images''',
                                                  ) !=
                                                  null)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 8.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final currentImage =
                                                          functions
                                                              .uniqueListElements(
                                                                  (getJsonField(
                                                                containerParseSiteResponse
                                                                    .jsonBody,
                                                                r'''$.images''',
                                                                true,
                                                              ) as List)
                                                                      .map<String>(
                                                                          (s) =>
                                                                              s.toString())
                                                                      .toList())
                                                              .toList();

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            currentImage.length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                width: 8.0),
                                                        itemBuilder: (context,
                                                            currentImageIndex) {
                                                          final currentImageItem =
                                                              currentImage[
                                                                  currentImageIndex];
                                                          return Visibility(
                                                            visible:
                                                                currentImageItem !=
                                                                        '',
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: SizedBox(
                                                                width: 119.0,
                                                                height: 177.0,
                                                                child: Stack(
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        functions
                                                                            .stringToImagePath(currentImageItem),
                                                                        width:
                                                                            119.0,
                                                                        height:
                                                                            177.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          119.0,
                                                                      height:
                                                                          177.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          119.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                            Colors.transparent
                                                                          ],
                                                                          stops: const [
                                                                            0.0,
                                                                            1.0
                                                                          ],
                                                                          begin: const AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          end: const AlignmentDirectional(
                                                                              0,
                                                                              1.0),
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(8.0),
                                                                          topRight:
                                                                              Radius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            119.0,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Colors.transparent,
                                                                              FlutterFlowTheme.of(context).primaryBackground
                                                                            ],
                                                                            stops: const [
                                                                              0.0,
                                                                              1.0
                                                                            ],
                                                                            begin:
                                                                                const AlignmentDirectional(0.0, -1.0),
                                                                            end:
                                                                                const AlignmentDirectional(0, 1.0),
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(8.0),
                                                                            bottomRight:
                                                                                Radius.circular(8.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('ADD_FROM_BROWSER_ConditionalBuilder_3l2r');
                                                                            logFirebaseEvent('ConditionalBuilder_update_page_state');
                                                                            _model.selectedImage =
                                                                                currentImageItem;
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (_model.selectedImage == currentImageItem) {
                                                                                return Container(
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 12.0,
                                                                                      height: 12.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                return Container(
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: const Color(0x1AFFFFFF),
                                                                                    ),
                                                                                  ),
                                                                                );
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
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              Container(
                                                width: 119.0,
                                                height: 177.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: const Color(0x32FFFFFF),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (_model.uploadedFile !=
                                                            null &&
                                                        (_model
                                                                .uploadedFile
                                                                ?.bytes
                                                                ?.isNotEmpty ??
                                                            false)) {
                                                      return SizedBox(
                                                        width: 119.0,
                                                        height: 177.0,
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.memory(
                                                                _model.uploadedFile
                                                                        ?.bytes ??
                                                                    Uint8List
                                                                        .fromList(
                                                                            []),
                                                                width: 119.0,
                                                                height: 177.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 119.0,
                                                              height: 177.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 119.0,
                                                              height: 48.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    Colors
                                                                        .transparent
                                                                  ],
                                                                  stops: const [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      const AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: 119.0,
                                                                height: 48.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Colors
                                                                          .transparent,
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                    ],
                                                                    stops: const [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: const AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'ADD_FROM_BROWSER_ConditionalBuilder_djo9');
                                                                    logFirebaseEvent(
                                                                        'ConditionalBuilder_update_page_state');
                                                                    _model.selectedImage =
                                                                        null;
                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (_model.selectedImage ==
                                                                              null ||
                                                                          _model.selectedImage ==
                                                                              '') {
                                                                        return Container(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 12.0,
                                                                              height: 12.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return Container(
                                                                          width:
                                                                              20.0,
                                                                          height:
                                                                              20.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                            border:
                                                                                Border.all(
                                                                              color: const Color(0x1AFFFFFF),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    } else {
                                                      return Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 12.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 36.0,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          icon: Icon(
                                                            Icons.add_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 21.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'ADD_FROM_BROWSER_add_rounded_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_store_media_for_upload');
                                                            final selectedMedia =
                                                                await selectMedia(
                                                              maxHeight:
                                                                  2000.00,
                                                              imageQuality: 95,
                                                              mediaSource:
                                                                  MediaSource
                                                                      .photoGallery,
                                                              multiImage: false,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading2 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];

                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();
                                                              } finally {
                                                                _model.isDataUploading2 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile2 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                });
                                                              } else {
                                                                setState(() {});
                                                                return;
                                                              }
                                                            }

                                                            if ((_model
                                                                        .uploadedLocalFile2
                                                                        .bytes
                                                                        ?.isNotEmpty ??
                                                                    false)) {
                                                              logFirebaseEvent(
                                                                  'IconButton_update_page_state');
                                                              _model.uploadedFile =
                                                                  _model
                                                                      .uploadedLocalFile2;
                                                              _model.selectedImage =
                                                                  null;
                                                              setState(() {});
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            ]
                                                .addToStart(
                                                    const SizedBox(width: 16.0))
                                                .addToEnd(
                                                    const SizedBox(width: 16.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 28.0, 16.0, 45.0),
                                        child: wrapWithModel(
                                          model: _model.saveToCollectionModel,
                                          updateCallback: () => setState(() {}),
                                          updateOnChange: true,
                                          child: PinkButtonWidget(
                                            text: 'Save To Collection',
                                            isDisabled: _model.isBlocked,
                                            currentAction: () async {
                                              logFirebaseEvent(
                                                  'ADD_FROM_BROWSER_SaveToCollection_CALLBA');
                                              var shouldSetState = false;
                                              logFirebaseEvent(
                                                  'SaveToCollection_validate_form');
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              logFirebaseEvent(
                                                  'SaveToCollection_update_page_state');
                                              _model.isBlocked = true;
                                              setState(() {});
                                              logFirebaseEvent(
                                                  'SaveToCollection_wait__delay');
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 100));
                                              if (_model.dropDownValue !=
                                                      null &&
                                                  _model.dropDownValue != '') {
                                                if ((_model.selectedImage ==
                                                            null ||
                                                        _model.selectedImage ==
                                                            '') &&
                                                    (_model.uploadedFile !=
                                                            null &&
                                                        (_model
                                                                .uploadedFile
                                                                ?.bytes
                                                                ?.isNotEmpty ??
                                                            false))) {
                                                  logFirebaseEvent(
                                                      'SaveToCollection_upload_file_to_supabase');
                                                  {
                                                    setState(() => _model
                                                            .isDataUploading3 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];
                                                    var selectedFiles =
                                                        <SelectedFile>[];
                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          _model
                                                                  .uploadedFile!
                                                                  .bytes!
                                                                  .isNotEmpty
                                                              ? [
                                                                  _model
                                                                      .uploadedFile!
                                                                ]
                                                              : <FFUploadedFile>[];
                                                      selectedFiles =
                                                          selectedFilesFromUploadedFiles(
                                                        selectedUploadedFiles,
                                                        storageFolderPath:
                                                            'wishImages',
                                                      );
                                                      downloadUrls =
                                                          await uploadSupabaseStorageFiles(
                                                        bucketName:
                                                            'EdayBucket',
                                                        selectedFiles:
                                                            selectedFiles,
                                                      );
                                                    } finally {
                                                      _model.isDataUploading3 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedFiles
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedFiles
                                                                .length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile3 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl3 =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }
                                                } else if (_model
                                                            .selectedImage !=
                                                        null &&
                                                    _model.selectedImage !=
                                                        '') {
                                                  logFirebaseEvent(
                                                      'SaveToCollection_custom_action');
                                                  _model.result = await actions
                                                      .uploadImageToSupabase(
                                                    _model.selectedImage!,
                                                  );
                                                  shouldSetState = true;
                                                  if (_model.result != null &&
                                                      _model.result != '') {
                                                    logFirebaseEvent(
                                                        'SaveToCollection_update_page_state');
                                                    _model.customUploadResult =
                                                        _model.result;
                                                  } else {
                                                    logFirebaseEvent(
                                                        'SaveToCollection_update_page_state');
                                                    _model.isBlocked = false;
                                                    setState(() {});
                                                    logFirebaseEvent(
                                                        'SaveToCollection_alert_dialog');
                                                    showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: const AlignmentDirectional(
                                                                  0.0, -1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child:
                                                                  const AlertDialogWarningWidget(
                                                                title:
                                                                    'Error !',
                                                                subtitle:
                                                                    'There was an error uploading the image. Please try again later.',
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'SaveToCollection_update_page_state');
                                                  _model.isBlocked = false;
                                                  setState(() {});
                                                  logFirebaseEvent(
                                                      'SaveToCollection_alert_dialog');
                                                  showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                    0.0, -1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child:
                                                                const AlertDialogWarningWidget(
                                                              title:
                                                                  'No image selected!',
                                                              subtitle:
                                                                  'Please select the image from the list below or upload your own',
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }

                                                logFirebaseEvent(
                                                    'SaveToCollection_backend_call');
                                                _model.createdWishRow =
                                                    await WishesTable().insert({
                                                  'visibily': true,
                                                  'collection': _model
                                                                  .dropDownValue !=
                                                              null &&
                                                          _model.dropDownValue !=
                                                              ''
                                                      ? _model.dropDownValue
                                                      : null,
                                                  'pair': FFAppState().pairID,
                                                  'created_by': currentUserUid,
                                                  'name': _model
                                                      .nameFieldTextController
                                                      .text,
                                                  'description': _model
                                                      .descriptionFieldTextController
                                                      .text,
                                                  'photo': () {
                                                    if ((_model.selectedImage !=
                                                                null &&
                                                            _model.selectedImage !=
                                                                '') &&
                                                        (_model.customUploadResult !=
                                                                null &&
                                                            _model.customUploadResult !=
                                                                '')) {
                                                      return _model
                                                          .customUploadResult;
                                                    } else if (_model
                                                                .selectedImage !=
                                                            null &&
                                                        _model.selectedImage !=
                                                            '') {
                                                      return _model
                                                          .selectedImage;
                                                    } else {
                                                      return _model
                                                          .uploadedFileUrl3;
                                                    }
                                                  }(),
                                                  'link': getJsonField(
                                                    containerParseSiteResponse
                                                        .jsonBody,
                                                    r'''$.link''',
                                                  ).toString(),
                                                });
                                                shouldSetState = true;
                                                if (true) {
                                                  logFirebaseEvent(
                                                      'SaveToCollection_backend_call');
                                                  _model.selectedCollection =
                                                      await CollectionsTable()
                                                          .queryRows(
                                                    queryFn: (q) => q.eq(
                                                      'uuid',
                                                      _model.dropDownValue,
                                                    ),
                                                  );
                                                  shouldSetState = true;
                                                  logFirebaseEvent(
                                                      'SaveToCollection_backend_call');
                                                  unawaited(
                                                    () async {
                                                      await WishesTable()
                                                          .update(
                                                        data: {
                                                          'visibily': _model
                                                              .selectedCollection
                                                              ?.first
                                                              .visibility,
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'uuid',
                                                          _model.createdWishRow
                                                              ?.uuid,
                                                        ),
                                                      );
                                                    }(),
                                                  );
                                                  shouldSetState = true;
                                                  logFirebaseEvent(
                                                      'SaveToCollection_bottom_sheet');
                                                  Navigator.pop(context);
                                                  logFirebaseEvent(
                                                      'SaveToCollection_navigate_to');

                                                  context.goNamed('My_Profile');
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'SaveToCollection_update_page_state');
                                                _model.isBlocked = false;
                                                setState(() {});
                                                logFirebaseEvent(
                                                    'SaveToCollection_alert_dialog');
                                                showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          const AlignmentDirectional(
                                                                  0.0, -1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child:
                                                              const AlertDialogWarningWidget(
                                                            title:
                                                                'No category selected !',
                                                            subtitle:
                                                                'Please select category from the dropdown or add new',
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              if (shouldSetState) {
                                                setState(() {});
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
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
