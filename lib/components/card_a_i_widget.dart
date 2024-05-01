import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_save_to_collection/b_s_save_to_collection_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'card_a_i_model.dart';
export 'card_a_i_model.dart';

class CardAIWidget extends StatefulWidget {
  const CardAIWidget({
    super.key,
    required this.wishAIElement,
  });

  final AiWishStruct? wishAIElement;

  @override
  State<CardAIWidget> createState() => _CardAIWidgetState();
}

class _CardAIWidgetState extends State<CardAIWidget> {
  late CardAIModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardAIModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('CARD_A_I_COMP_MainImage_ON_TAP');
              logFirebaseEvent('MainImage_backend_call');
              _model.newWishRow = await WishesTable().insert({
                'pair': FFAppState().pairID,
                'created_by': currentUserUid,
                'name': widget.wishAIElement?.name,
                'description': widget.wishAIElement?.description,
                'photo': widget.wishAIElement?.image,
                'link': widget.wishAIElement?.link,
                'visibily': true,
              });
              logFirebaseEvent('MainImage_navigate_to');

              context.pushNamed(
                'Wish_Main',
                queryParameters: {
                  'isFromAI': serializeParam(
                    true,
                    ParamType.bool,
                  ),
                  'selectedWishID': serializeParam(
                    _model.newWishRow?.uuid,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );

              setState(() {});
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 300),
                fadeOutDuration: const Duration(milliseconds: 300),
                imageUrl:
                    functions.stringToImagePath(widget.wishAIElement!.image),
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 77.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xA5000000), Colors.transparent],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Color(0xA6000000)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (false)
                  Container(
                    width: 18.0,
                    height: 18.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 200),
                      fadeOutDuration: const Duration(milliseconds: 200),
                      imageUrl: '',
                      fit: BoxFit.cover,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'AI Generated',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nuckle',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 10.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                          lineHeight: 1.4,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.wishAIElement?.category != null &&
                      widget.wishAIElement?.category != '')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 34.0, 0.0),
                      child: Text(
                        widget.wishAIElement!.category,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nuckle',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: false,
                              lineHeight: 1.4,
                            ),
                      ),
                    ),
                  if (widget.wishAIElement?.name != null &&
                      widget.wishAIElement?.name != '')
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 34.0, 0.0),
                      child: Text(
                        widget.wishAIElement!.name,
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nuckle',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: false,
                              lineHeight: 1.4,
                            ),
                      ),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (widget.wishAIElement?.description != null &&
                          widget.wishAIElement?.description != '')
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 34.0, 0.0),
                            child: Text(
                              widget.wishAIElement!.description,
                              maxLines: 4,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: const Color(0x98FFFFFF),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
              child: FutureBuilder<List<WishesRow>>(
                future: WishesTable().queryRows(
                  queryFn: (q) => q
                      .eq(
                        'pair',
                        FFAppState().pairID,
                      )
                      .eq(
                        'name',
                        widget.wishAIElement?.name,
                      )
                      .eq(
                        'description',
                        widget.wishAIElement?.description,
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
                          color: FlutterFlowTheme.of(context).pinkButton,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<WishesRow> addToCollectionWishesRowList = snapshot.data!;
                  return Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: const Color(0x28FFFFFF),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        if (addToCollectionWishesRowList.isNotEmpty) {
                          return Icon(
                            FFIcons.kfcheck,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 15.0,
                          );
                        } else {
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'CARD_A_I_COMP_Icon_jhzkwbun_ON_TAP');
                              logFirebaseEvent('Icon_backend_call');
                              _model.newWishRowIcon =
                                  await WishesTable().insert({
                                'pair': FFAppState().pairID,
                                'created_by': currentUserUid,
                                'name': widget.wishAIElement?.name,
                                'description':
                                    widget.wishAIElement?.description,
                                'photo': widget.wishAIElement?.image,
                                'link': widget.wishAIElement?.link,
                                'visibily': true,
                                'collection': null,
                              });
                              logFirebaseEvent('Icon_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BSSaveToCollectionWidget(
                                        isFromAI: true,
                                        selectedWishRow: _model.newWishRowIcon,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              setState(() {});
                            },
                            child: Icon(
                              FFIcons.kfolderAdd,
                              color: FlutterFlowTheme.of(context).info,
                              size: 15.0,
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
