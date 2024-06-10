import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'b_s_edit_collection_model.dart';
export 'b_s_edit_collection_model.dart';

class BSEditCollectionWidget extends StatefulWidget {
  const BSEditCollectionWidget({
    super.key,
    required this.selectedCollection,
  });

  final CollectionsRow? selectedCollection;

  @override
  State<BSEditCollectionWidget> createState() => _BSEditCollectionWidgetState();
}

class _BSEditCollectionWidgetState extends State<BSEditCollectionWidget> {
  late BSEditCollectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSEditCollectionModel());

    _model.textController ??=
        TextEditingController(text: widget.selectedCollection?.name);
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
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
                  'Edit Collection Name',
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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 34.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    const Duration(milliseconds: 200),
                    () => setState(() {}),
                  ),
                  autofocus: false,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: false,
                    hintText: 'Fashion',
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
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nuckle',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  cursorColor: FlutterFlowTheme.of(context).pinkButton,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              if (_model.isEmptyName)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    _model.textController.text == ''
                        ? 'Field is required'
                        : 'Name must be less then 15 characters',
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nuckle',
                          color: FlutterFlowTheme.of(context).error,
                          fontSize: 11.0,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 45.0),
                child: wrapWithModel(
                  model: _model.pinkButtonModel,
                  updateCallback: () => setState(() {}),
                  child: PinkButtonWidget(
                    text: 'Save',
                    currentAction: () async {
                      logFirebaseEvent(
                          'B_S_EDIT_COLLECTION_Container_tesekevs_C');
                      logFirebaseEvent('pinkButton_update_component_state');
                      _model.isEmptyName = false;
                      setState(() {});
                      if ((_model.textController.text != '') &&
                          (_model.textController.text.length < 15)) {
                        logFirebaseEvent('pinkButton_backend_call');
                        await CollectionsTable().update(
                          data: {
                            'name': _model.textController.text,
                            'lowercase_name':
                                _model.textController.text.toLowerCase(),
                          },
                          matchingRows: (rows) => rows.eq(
                            'uuid',
                            widget.selectedCollection?.uuid,
                          ),
                        );
                        logFirebaseEvent('pinkButton_update_app_state');

                        FFAppState().update(() {});
                        logFirebaseEvent('pinkButton_bottom_sheet');
                        Navigator.pop(context);
                      } else {
                        logFirebaseEvent('pinkButton_update_component_state');
                        _model.isEmptyName = true;
                        setState(() {});
                      }
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
