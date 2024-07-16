import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_add_tour_own_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'b_s_feeling_model.dart';
export 'b_s_feeling_model.dart';

class BSFeelingWidget extends StatefulWidget {
  const BSFeelingWidget({
    super.key,
    this.currentUserFeelingRow,
    this.currentFeelingRow,
    this.avatar,
  });

  final UserFeelingsRow? currentUserFeelingRow;
  final FeelingsRow? currentFeelingRow;
  final String? avatar;

  @override
  State<BSFeelingWidget> createState() => _BSFeelingWidgetState();
}

class _BSFeelingWidgetState extends State<BSFeelingWidget> {
  late BSFeelingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSFeelingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('B_S_FEELING_BS_Feeling_ON_INIT_STATE');
      if (widget.currentUserFeelingRow != null) {
        logFirebaseEvent('BS_Feeling_update_component_state');
        _model.selectedColor = valueOrDefault<Color>(
          Color(int.parse((widget.currentUserFeelingRow!.color!))),
          FlutterFlowTheme.of(context).error,
        );
        setState(() {});
        if (widget.currentUserFeelingRow?.customFeeling != null &&
            widget.currentUserFeelingRow?.customFeeling != '') {
          logFirebaseEvent('BS_Feeling_update_component_state');
          _model.selectedFeeling =
              widget.currentUserFeelingRow!.customFeeling!;
          setState(() {});
        } else {
          if (widget.currentFeelingRow != null) {
            logFirebaseEvent('BS_Feeling_update_component_state');
            _model.selectedFeeling = widget.currentFeelingRow!.name!;
            setState(() {});
          }
        }
      }
    });

    _model.nameFieldTextController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();
    _model.nameFieldFocusNode!.addListener(() => setState(() {}));
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
          height: MediaQuery.sizeOf(context).height * 0.9,
          decoration: const BoxDecoration(
            color: Color(0x18F2F1F3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        width: 33.0,
                        height: 4.0,
                        decoration: const BoxDecoration(
                          color: Color(0x3AF2F1F3),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Stack(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    Container(
                                      width: 117.0,
                                      height: 117.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: _model.selectedColor,
                                          width: 3.0,
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (widget.avatar != null &&
                                            widget.avatar != '') {
                                          return Container(
                                            width: 95.0,
                                            height: 95.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0x15FFFFFF),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  functions.stringToImagePath(
                                                      widget.avatar!),
                                                ).image,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            width: 95.0,
                                            height: 95.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x15FFFFFF),
                                              shape: BoxShape.circle,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Text(
                                    'I\'m Feeling...',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final color =
                                        FFAppConstants.colorsList.toList();

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(color.length,
                                          (colorIndex) {
                                        final colorItem = color[colorIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'B_S_FEELING_COMP_Stack_ejt99s1e_ON_TAP');
                                            logFirebaseEvent(
                                                'Stack_update_component_state');
                                            _model.selectedColor = colorItem;
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                            width: 45.0,
                                            height: 45.0,
                                            child: Stack(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              children: [
                                                if (colorItem ==
                                                    _model.selectedColor)
                                                  Container(
                                                    width: 45.0,
                                                    height: 45.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ),
                                                Container(
                                                  width: 39.0,
                                                  height: 39.0,
                                                  decoration: BoxDecoration(
                                                    color: colorItem,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).divide(const SizedBox(width: 17.0)),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 30.0, 16.0, 26.0),
                                child: FutureBuilder<List<FeelingsRow>>(
                                  future: FeelingsTable().queryRows(
                                    queryFn: (q) =>
                                        q.order('created_at', ascending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .pinkButton,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<FeelingsRow> containerFeelingsRowList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child:
                                          FutureBuilder<List<UserFeelingsRow>>(
                                        future: UserFeelingsTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'created_by',
                                                currentUserUid,
                                              )
                                              .not(
                                                'custom feeling',
                                                'is',
                                                null,
                                              ),
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
                                          List<UserFeelingsRow>
                                              containerUserFeelingsRowList =
                                              snapshot.data!;

                                          return Container(
                                            decoration: const BoxDecoration(),
                                            child: Builder(
                                              builder: (context) {
                                                final feelingName = functions
                                                    .mergeTwoListsStrings(
                                                        containerFeelingsRowList
                                                            .map((e) => e.name)
                                                            .withoutNulls
                                                            .toList(),
                                                        containerUserFeelingsRowList
                                                            .map((e) =>
                                                                e.customFeeling)
                                                            .withoutNulls
                                                            .toList())
                                                    .toList();

                                                return Wrap(
                                                  spacing: 12.0,
                                                  runSpacing: 12.0,
                                                  alignment:
                                                      WrapAlignment.center,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      feelingName.length,
                                                      (feelingNameIndex) {
                                                    final feelingNameItem =
                                                        feelingName[
                                                            feelingNameIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'B_S_FEELING_Container_g58x1qnh_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Container_update_component_state');
                                                        _model.selectedFeeling =
                                                            feelingNameItem;
                                                        _model.isCustom = false;
                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            (feelingNameItem ==
                                                                        _model
                                                                            .selectedFeeling) &&
                                                                    !_model
                                                                        .isCustom
                                                                ? _model
                                                                    .selectedColor
                                                                : const Color(
                                                                    0x14FFFFFF),
                                                            const Color(0x14FFFFFF),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  14.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Text(
                                                                feelingNameItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nuckle',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: Color(0x0CF2F1F3),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 16.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.info,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 16.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Your mood will only be seen by you and your partner',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: const Color(0x99FFFFFF),
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (_model.isCustom)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 105.0),
                              child: Container(
                                height: 140.0,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          'Add Your Own',
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
                                      Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.nameFieldTextController,
                                            focusNode:
                                                _model.nameFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.nameFieldTextController',
                                              const Duration(milliseconds: 200),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              hintText: 'Your feeling',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            const Color(0x98FFFFFF),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              errorStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .pinkButton,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0x0FFFFFFF),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 13.0,
                                                          20.0, 13.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                            maxLength: 15,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if (!_model.isCustom)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 105.0),
                              child: Container(
                                height: 140.0,
                                decoration: const BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'B_S_FEELING_Container_varrkv9p_ON_TAP');
                                    logFirebaseEvent(
                                        'emptyAddTourOwn_update_component_state');
                                    _model.isCustom = true;
                                    setState(() {});
                                  },
                                  child: wrapWithModel(
                                    model: _model.emptyAddTourOwnModel,
                                    updateCallback: () => setState(() {}),
                                    child: const EmptyAddTourOwnWidget(),
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
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 22.0, 16.0, 40.0),
                  child: wrapWithModel(
                    model: _model.pinkButtonModel,
                    updateCallback: () => setState(() {}),
                    child: PinkButtonWidget(
                      text: 'Confirm',
                      currentAction: () async {
                        logFirebaseEvent(
                            'B_S_FEELING_Container_k2s5q493_CALLBACK');
                        if (_model.isCustom) {
                          logFirebaseEvent('pinkButton_validate_form');
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          logFirebaseEvent('pinkButton_backend_call');
                          _model.newUserFeelingRow =
                              await UserFeelingsTable().insert({
                            'color': _model.selectedColor.value.toString(),
                            'custom feeling':
                                _model.nameFieldTextController.text,
                            'created_by': currentUserUid,
                          });
                          logFirebaseEvent('pinkButton_backend_call');
                          await UsersTable().update(
                            data: {
                              'current_feeling': _model.newUserFeelingRow?.id,
                            },
                            matchingRows: (rows) => rows.eq(
                              'id',
                              currentUserUid,
                            ),
                          );
                        } else {
                          if (widget.currentUserFeelingRow != null) {
                            logFirebaseEvent('pinkButton_backend_call');
                            _model.foundFeelingRow =
                                await FeelingsTable().queryRows(
                              queryFn: (q) => q.eq(
                                'name',
                                _model.selectedFeeling,
                              ),
                            );
                            if (_model.foundFeelingRow!.isNotEmpty) {
                              logFirebaseEvent('pinkButton_backend_call');
                              _model.foundUserFeeling =
                                  await UserFeelingsTable().queryRows(
                                queryFn: (q) => q
                                    .eq(
                                      'created_by',
                                      currentUserUid,
                                    )
                                    .is_(
                                      'custom feeling',
                                      null,
                                    ),
                              );
                              if (_model.foundUserFeeling!.isNotEmpty) {
                                logFirebaseEvent('pinkButton_backend_call');
                                _model.updatedUserFeelingRow =
                                    await UserFeelingsTable().update(
                                  data: {
                                    'color':
                                        _model.selectedColor.value.toString(),
                                    'feeling':
                                        _model.foundFeelingRow?.first.id,
                                    'custom feeling': null,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    _model.foundUserFeeling?.first.id,
                                  ),
                                  returnRows: true,
                                );
                                logFirebaseEvent('pinkButton_backend_call');
                                await UsersTable().update(
                                  data: {
                                    'current_feeling':
                                        _model.updatedUserFeelingRow?.first.id,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    currentUserUid,
                                  ),
                                );
                              } else {
                                logFirebaseEvent('pinkButton_backend_call');
                                _model.newUserFeelingRow3 =
                                    await UserFeelingsTable().insert({
                                  'color':
                                      _model.selectedColor.value.toString(),
                                  'feeling': _model.foundFeelingRow?.first.id,
                                  'custom feeling': null,
                                });
                                logFirebaseEvent('pinkButton_backend_call');
                                await UsersTable().update(
                                  data: {
                                    'current_feeling':
                                        _model.newUserFeelingRow3?.id,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'id',
                                    currentUserUid,
                                  ),
                                );
                              }
                            } else {
                              logFirebaseEvent('pinkButton_backend_call');
                              _model.foundUserCustomFeeling =
                                  await UserFeelingsTable().queryRows(
                                queryFn: (q) => q
                                    .eq(
                                      'created_by',
                                      currentUserUid,
                                    )
                                    .eq(
                                      'custom feeling',
                                      _model.selectedFeeling,
                                    ),
                              );
                              logFirebaseEvent('pinkButton_backend_call');
                              _model.updatedUserFeelingRow2 =
                                  await UserFeelingsTable().update(
                                data: {
                                  'color':
                                      _model.selectedColor.value.toString(),
                                  'feeling': null,
                                  'custom feeling': _model.selectedFeeling,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  _model.foundUserCustomFeeling?.first.id,
                                ),
                                returnRows: true,
                              );
                              logFirebaseEvent('pinkButton_backend_call');
                              await UsersTable().update(
                                data: {
                                  'current_feeling':
                                      _model.updatedUserFeelingRow2?.first.id,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'id',
                                  currentUserUid,
                                ),
                              );
                            }
                          } else {
                            logFirebaseEvent('pinkButton_backend_call');
                            _model.foundFeelingRow2 =
                                await FeelingsTable().queryRows(
                              queryFn: (q) => q.eq(
                                'name',
                                _model.selectedFeeling,
                              ),
                            );
                            logFirebaseEvent('pinkButton_backend_call');
                            _model.newUserFeelingRow2 =
                                await UserFeelingsTable().insert({
                              'color': _model.selectedColor.value.toString(),
                              'feeling': _model.foundFeelingRow2?.first.id,
                              'created_by': currentUserUid,
                            });
                            logFirebaseEvent('pinkButton_backend_call');
                            await UsersTable().update(
                              data: {
                                'current_feeling':
                                    _model.newUserFeelingRow2?.id,
                              },
                              matchingRows: (rows) => rows.eq(
                                'id',
                                currentUserUid,
                              ),
                            );
                          }
                        }

                        logFirebaseEvent('pinkButton_backend_call');
                        _model.partnerRow = await UsersTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'pair',
                                FFAppState().pairID,
                              )
                              .neq(
                                'id',
                                currentUserUid,
                              ),
                        );
                        if (_model.partnerRow!.isNotEmpty) {
                          logFirebaseEvent('pinkButton_backend_call');
                          unawaited(
                            () async {
                              await NotificationsTable().insert({
                                'from_user': currentUserUid,
                                'to_user': _model.partnerRow?.first.id,
                                'type': 'feeling',
                                'details': <String, String>{
                                  'color':
                                      _model.selectedColor.value.toString(),
                                  'feeling': _model.selectedFeeling,
                                },
                              });
                            }(),
                          );
                        }
                        logFirebaseEvent('pinkButton_update_app_state');

                        _model.updatePage(() {});
                        logFirebaseEvent('pinkButton_bottom_sheet');
                        Navigator.pop(context);

                        setState(() {});
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
