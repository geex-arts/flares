import '/backend/supabase/supabase.dart';
import '/components/empty_collections_widget_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_edit_collection/b_s_edit_collection_widget.dart';
import '/wishlist/b_s_new_collection/b_s_new_collection_widget.dart';
import '/wishlist/n_save_to_collection/n_save_to_collection_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'b_s_save_to_collection2_model.dart';
export 'b_s_save_to_collection2_model.dart';

class BSSaveToCollection2Widget extends StatefulWidget {
  const BSSaveToCollection2Widget({
    super.key,
    this.selectedWishRow,
    this.currentCollectionID,
    bool? isManagement,
  }) : isManagement = isManagement ?? false;

  final WishesRow? selectedWishRow;
  final String? currentCollectionID;
  final bool isManagement;

  @override
  State<BSSaveToCollection2Widget> createState() =>
      _BSSaveToCollection2WidgetState();
}

class _BSSaveToCollection2WidgetState extends State<BSSaveToCollection2Widget>
    with TickerProviderStateMixin {
  late BSSaveToCollection2Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSSaveToCollection2Model());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('B_S_SAVE_TO_COLLECTION2_BS_Save_To_Colle');
      if (widget.currentCollectionID != null &&
          widget.currentCollectionID != '') {
        logFirebaseEvent('BS_Save_To_Collection2_update_component_');
        setState(() {
          _model.selectedCollectionID = widget.currentCollectionID;
        });
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => setState(() {}));
    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return
        // на модалку при вызове ставить 40% высоту
        ClipRRect(
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
        child: FutureBuilder<List<CollectionsRow>>(
          future: CollectionsTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'pair',
                  FFAppState().pairID,
                )
                .order('order', ascending: true),
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
            List<CollectionsRow> containerCollectionsRowList = snapshot.data!;
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 12.0),
                    child: Text(
                      widget.isManagement
                          ? 'Manage Collections'
                          : 'Save to Collections',
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
                  Builder(
                    builder: (context) {
                      if (!_model.isLoading) {
                        return Container(
                          height: 300.0,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (containerCollectionsRowList.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 12.0, 12.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
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
                                      hintText: 'Search',
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
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .pinkButton,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                              20.0, 0.0, 20.0, 0.0),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: Color(0x7FF2F1F3),
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
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor:
                                        FlutterFlowTheme.of(context).pinkButton,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              if (containerCollectionsRowList.isNotEmpty)
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 10.0, 16.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final currentCollection = ((_model.textController
                                                                .text !=
                                                            '') &&
                                                    (_model.textController.text
                                                            .length >
                                                        1)
                                                ? containerCollectionsRowList
                                                    .where((e) =>
                                                        (e.lowercaseName!)
                                                            .contains(_model
                                                                .textController
                                                                .text
                                                                .toLowerCase()))
                                                    .toList()
                                                : containerCollectionsRowList)
                                            .toList();
                                        if (currentCollection.isEmpty) {
                                          return const Center(
                                            child:
                                                EmptyCollectionsWidgetWidget(),
                                          );
                                        }
                                        return ReorderableListView.builder(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          itemCount: currentCollection.length,
                                          itemBuilder: (context,
                                              currentCollectionIndex) {
                                            final currentCollectionItem =
                                                currentCollection[
                                                    currentCollectionIndex];
                                            return Container(
                                              key: ValueKey(
                                                  "ListView_0sqpsacf" '_' +
                                                      currentCollectionIndex
                                                          .toString()),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'B_S_SAVE_TO_COLLECTION2_Container_5dmbmk');
                                                  if (!widget.isManagement) {
                                                    logFirebaseEvent(
                                                        'Container_update_component_state');
                                                    setState(() {
                                                      _model.selectedCollectionID =
                                                          currentCollectionItem
                                                              .uuid;
                                                    });
                                                    logFirebaseEvent(
                                                        'Container_backend_call');
                                                    await WishesTable().update(
                                                      data: {
                                                        'collection':
                                                            currentCollectionItem
                                                                .uuid,
                                                        'visibily':
                                                            currentCollectionItem
                                                                .visibility,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'uuid',
                                                        widget.selectedWishRow
                                                            ?.uuid,
                                                      ),
                                                    );
                                                    logFirebaseEvent(
                                                        'Container_update_app_state');
                                                    _model.updatePage(() {});
                                                    logFirebaseEvent(
                                                        'Container_bottom_sheet');
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 56.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (!widget.isManagement)
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'B_S_SAVE_TO_COLLECTION2_ConditionalBuild');
                                                            logFirebaseEvent(
                                                                'ConditionalBuilder_update_component_stat');
                                                            setState(() {
                                                              _model.selectedCollectionID =
                                                                  currentCollectionItem
                                                                      .uuid;
                                                            });
                                                            logFirebaseEvent(
                                                                'ConditionalBuilder_backend_call');
                                                            _model.updatedRow =
                                                                await WishesTable()
                                                                    .update(
                                                              data: {
                                                                'collection':
                                                                    currentCollectionItem
                                                                        .uuid,
                                                                'visibily':
                                                                    currentCollectionItem
                                                                        .visibility,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'uuid',
                                                                widget
                                                                    .selectedWishRow
                                                                    ?.uuid,
                                                              ),
                                                              returnRows: true,
                                                            );
                                                            logFirebaseEvent(
                                                                'ConditionalBuilder_update_app_state');
                                                            _model.updatePage(
                                                                () {});
                                                            logFirebaseEvent(
                                                                'ConditionalBuilder_bottom_sheet');
                                                            Navigator.pop(
                                                                context);

                                                            setState(() {});
                                                          },
                                                          child: Builder(
                                                            builder: (context) {
                                                              if ((_model.selectedCollectionID !=
                                                                          null &&
                                                                      _model.selectedCollectionID !=
                                                                          '') &&
                                                                  (_model.selectedCollectionID ==
                                                                      currentCollectionItem
                                                                          .uuid)) {
                                                                return Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          12.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return Container(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: const Color(
                                                                          0x1AFFFFFF),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            currentCollectionItem
                                                                .name!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      if (widget.isManagement)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'B_S_SAVE_TO_COLLECTION2_Container_wi9i39');
                                                              logFirebaseEvent(
                                                                  'Container_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          BSEditCollectionWidget(
                                                                        selectedCollection:
                                                                            currentCollectionItem,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(
                                                                      () {}));
                                                            },
                                                            child: Container(
                                                              width: 24.0,
                                                              height: 24.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Icon(
                                                                Icons.dehaze,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 14.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (widget.isManagement)
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      28.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'B_S_SAVE_TO_COLLECTION2_Container_yqhps6');
                                                              logFirebaseEvent(
                                                                  'Container_bottom_sheet');
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return WebViewAware(
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          NSaveToCollectionWidget(
                                                                        selectedCollectionID:
                                                                            currentCollectionItem.uuid,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.result =
                                                                          value));

                                                              if (_model
                                                                  .result!) {
                                                                logFirebaseEvent(
                                                                    'Container_update_component_state');
                                                                _model
                                                                    .updatePage(
                                                                        () {});
                                                                logFirebaseEvent(
                                                                    'Container_bottom_sheet');
                                                                Navigator.pop(
                                                                    context);
                                                              }

                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              width: 24.0,
                                                              height: 24.0,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .trashAlt,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 14.0,
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
                                          onReorder: (int reorderableOldIndex,
                                              int reorderableNewIndex) async {
                                            logFirebaseEvent(
                                                'B_S_SAVE_TO_COLLECTION2_ListView_0sqpsac');
                                            logFirebaseEvent(
                                                'ListView_update_component_state');
                                            setState(() {
                                              _model.isLoading = true;
                                            });
                                            logFirebaseEvent(
                                                'ListView_custom_action');
                                            await actions.reorderCollections(
                                              containerCollectionsRowList
                                                  .toList(),
                                              reorderableOldIndex,
                                              reorderableNewIndex,
                                            );
                                            logFirebaseEvent(
                                                'ListView_update_component_state');
                                            _model.updatePage(() {
                                              _model.isLoading = false;
                                            });
                                            logFirebaseEvent(
                                                'ListView_update_app_state');
                                            setState(() {});

                                            setState(() {});
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 85.0),
                          child: Container(
                            height: 300.0,
                            decoration: const BoxDecoration(),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, -0.3),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 40.0, 0.0, 0.0),
                                child: Image.asset(
                                  'assets/images/logo.webp',
                                  width: 155.0,
                                  height: 157.0,
                                  fit: BoxFit.cover,
                                ).animateOnPageLoad(
                                    animationsMap['imageOnPageLoadAnimation']!),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  if (!_model.isLoading)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 45.0),
                      child: wrapWithModel(
                        model: _model.createnewCollectionModel,
                        updateCallback: () => setState(() {}),
                        child: PinkButtonWidget(
                          text: 'Create new Collection',
                          currentAction: () async {
                            logFirebaseEvent(
                                'B_S_SAVE_TO_COLLECTION2_CreatenewCollect');
                            logFirebaseEvent(
                                'CreatenewCollection_bottom_sheet');
                            Navigator.pop(context);
                            if (widget.isManagement) {
                              logFirebaseEvent(
                                  'CreatenewCollection_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const BSNewCollectionWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else {
                              logFirebaseEvent(
                                  'CreatenewCollection_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BSNewCollectionWidget(
                                        selectedWishRow: widget.selectedWishRow,
                                        isFromBrowser: true,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          },
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
