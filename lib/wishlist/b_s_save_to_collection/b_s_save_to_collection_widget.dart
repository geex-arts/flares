import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_collections_widget_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_new_collection/b_s_new_collection_widget.dart';
import 'dart:async';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'b_s_save_to_collection_model.dart';
export 'b_s_save_to_collection_model.dart';

class BSSaveToCollectionWidget extends StatefulWidget {
  const BSSaveToCollectionWidget({
    super.key,
    this.selectedWishRow,
    bool? isFromWebview,
    bool? isFromAI,
  })  : isFromWebview = isFromWebview ?? false,
        isFromAI = isFromAI ?? false;

  final WishesRow? selectedWishRow;
  final bool isFromWebview;
  final bool isFromAI;

  @override
  State<BSSaveToCollectionWidget> createState() =>
      _BSSaveToCollectionWidgetState();
}

class _BSSaveToCollectionWidgetState extends State<BSSaveToCollectionWidget> {
  late BSSaveToCollectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSSaveToCollectionModel());

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
          sigmaX: 70.0,
          sigmaY: 70.0,
        ),
        child: FutureBuilder<List<CollectionsRow>>(
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
                    color: FlutterFlowTheme.of(context).pinkButton,
                    size: 50.0,
                  ),
                ),
              );
            }
            List<CollectionsRow> containerCollectionsRowList = snapshot.data!;
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: widget.isFromWebview
                    ? const Color(0xFF33393C)
                    : const Color(0x18F2F1F3),
                borderRadius: const BorderRadius.only(
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
                      'Save to Collections',
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
                  Container(
                    height: 300.0,
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (containerCollectionsRowList.isNotEmpty)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
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
                                    color:
                                        FlutterFlowTheme.of(context).pinkButton,
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
                                    color: FlutterFlowTheme.of(context).info,
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
                                  16.0, 10.0, 16.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final currentCollection = ((_model.textController.text !=
                                                      '') &&
                                              (_model.textController.text
                                                      .length >
                                                  1)
                                          ? containerCollectionsRowList
                                              .where((e) => (e.lowercaseName!)
                                                  .contains(_model
                                                      .textController.text
                                                      .toLowerCase()))
                                              .toList()
                                          : containerCollectionsRowList)
                                      .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: currentCollection.length,
                                    itemBuilder:
                                        (context, currentCollectionIndex) {
                                      final currentCollectionItem =
                                          currentCollection[
                                              currentCollectionIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'B_S_SAVE_TO_COLLECTION_Container_t8glhtm');
                                          if (widget.selectedWishRow != null) {
                                            if (widget.isFromAI) {
                                              logFirebaseEvent(
                                                  'Container_backend_call');
                                              unawaited(
                                                () async {
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
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'uuid',
                                                      widget.selectedWishRow
                                                          ?.uuid,
                                                    ),
                                                    returnRows: true,
                                                  );
                                                }(),
                                              );
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_backend_call');
                                              await WishesTable().insert({
                                                'collection':
                                                    currentCollectionItem.uuid,
                                                'pair': FFAppState().pairID,
                                                'created_by': currentUserUid,
                                                'name': widget
                                                    .selectedWishRow?.name,
                                                'description': widget
                                                    .selectedWishRow
                                                    ?.description,
                                                'photo': widget
                                                    .selectedWishRow?.photo,
                                                'link': widget
                                                    .selectedWishRow?.link,
                                                'parent_uuid': widget
                                                    .selectedWishRow?.uuid,
                                                'visibily':
                                                    currentCollectionItem
                                                        .visibility,
                                              });
                                            }
                                          }
                                          logFirebaseEvent(
                                              'Container_update_app_state');
                                          _model.updatePage(() {});
                                          logFirebaseEvent(
                                              'Container_bottom_sheet');
                                          Navigator.pop(context);

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 56.0,
                                          decoration: const BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (currentCollectionItem.photo !=
                                                      null &&
                                                  currentCollectionItem.photo !=
                                                      '')
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13.0),
                                                  child: Image.network(
                                                    currentCollectionItem
                                                        .photo!,
                                                    width: 40.0,
                                                    height: 40.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  currentCollectionItem.name!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
                  if (containerCollectionsRowList.isEmpty)
                    wrapWithModel(
                      model: _model.emptyCollectionsWidgetModel,
                      updateCallback: () => setState(() {}),
                      child: const EmptyCollectionsWidgetWidget(),
                    ),
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
                              'B_S_SAVE_TO_COLLECTION_CreatenewCollecti');
                          if (widget.selectedWishRow != null) {
                            logFirebaseEvent(
                                'CreatenewCollection_bottom_sheet');
                            Navigator.pop(context);
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
                                      isFromBrowser: widget.isFromAI,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          } else {
                            logFirebaseEvent(
                                'CreatenewCollection_bottom_sheet');
                            Navigator.pop(context);
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
                                    child: const BSNewCollectionWidget(
                                      isFromWebview: true,
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
