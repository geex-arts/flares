import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'b_s_new_collection_model.dart';
export 'b_s_new_collection_model.dart';

class BSNewCollectionWidget extends StatefulWidget {
  const BSNewCollectionWidget({
    super.key,
    this.selectedWishRow,
    bool? isFromBrowser,
  }) : this.isFromBrowser = isFromBrowser ?? false;

  final WishesRow? selectedWishRow;
  final bool isFromBrowser;

  @override
  State<BSNewCollectionWidget> createState() => _BSNewCollectionWidgetState();
}

class _BSNewCollectionWidgetState extends State<BSNewCollectionWidget> {
  late BSNewCollectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSNewCollectionModel());

    _model.textController ??= TextEditingController();
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
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.only(
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
          decoration: BoxDecoration(
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  width: 33.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: Color(0x3AF2F1F3),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 12.0),
                child: Text(
                  'New Collection',
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
              Divider(
                thickness: 1.0,
                color: Color(0x0CF2F1F3),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    _model.isSwitch
                        ? 'Only you will see the created collection'
                        : 'The created collection will be visible by anyone',
                    'Only you will see the created collection',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nuckle',
                        color: Color(0x9AFFFFFF),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: valueOrDefault<double>(
                        !_model.isSwitch ? 1.0 : 0.6,
                        0.6,
                      ),
                      child: Text(
                        'PUBLIC',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nuckle',
                              color: FlutterFlowTheme.of(context).info,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Switch.adaptive(
                        value: _model.switchValue ??= _model.isSwitch,
                        onChanged: (newValue) async {
                          setState(() => _model.switchValue = newValue!);
                          if (newValue!) {
                            setState(() {
                              _model.isSwitch = true;
                            });
                          } else {
                            setState(() {
                              _model.isSwitch = false;
                            });
                          }
                        },
                        activeColor: FlutterFlowTheme.of(context).info,
                        activeTrackColor: Color(0xFFFF005C),
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        inactiveThumbColor: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    Opacity(
                      opacity: valueOrDefault<double>(
                        _model.isSwitch ? 1.0 : 0.6,
                        1.0,
                      ),
                      child: Text(
                        'PRIVATE',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nuckle',
                              color: FlutterFlowTheme.of(context).info,
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: false,
                    hintText: 'Fashion',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Nuckle',
                              color: Color(0x98FFFFFF),
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
                      borderSide: BorderSide(
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
                    fillColor: Color(0x0FFFFFFF),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: Text(
                    'Field is required',
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 45.0),
                child: wrapWithModel(
                  model: _model.pinkButtonModel,
                  updateCallback: () => setState(() {}),
                  child: PinkButtonWidget(
                    text: 'Create',
                    currentAction: () async {
                      var _shouldSetState = false;
                      setState(() {
                        _model.isEmptyName = false;
                      });
                      if (_model.textController.text != null &&
                          _model.textController.text != '') {
                        _model.newCollectionRowCopy =
                            await CollectionsTable().insert({
                          'name': _model.textController.text,
                          'visibility': !_model.isSwitch,
                          'created_by': currentUserUid,
                          'lowercase_name':
                              _model.textController.text.toLowerCase(),
                          'pair': FFAppState().pairID,
                        });
                        _shouldSetState = true;
                        if (widget.selectedWishRow != null) {
                          if (widget.isFromBrowser) {
                            unawaited(
                              () async {
                                await WishesTable().update(
                                  data: {
                                    'collection':
                                        _model.newCollectionRowCopy?.uuid,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'uuid',
                                    widget.selectedWishRow?.uuid,
                                  ),
                                );
                              }(),
                            );
                            Navigator.pop(context);

                            context.goNamed('My_Profile');

                            if (_shouldSetState) setState(() {});
                            return;
                          } else {
                            await WishesTable().insert({
                              'collection': _model.newCollectionRowCopy?.uuid,
                              'pair': FFAppState().pairID,
                              'created_by': currentUserUid,
                              'name': widget.selectedWishRow?.name,
                              'description':
                                  widget.selectedWishRow?.description,
                              'photo': widget.selectedWishRow?.photo,
                              'link': widget.selectedWishRow?.link,
                              'copied_from': widget.selectedWishRow?.createdBy,
                            });
                          }
                        }
                        _model.updatePage(() {});
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          _model.isEmptyName = true;
                        });
                      }

                      if (_shouldSetState) setState(() {});
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
