import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/wishlist/b_s_ask_day/b_s_ask_day_widget.dart';
import '/wishlist/b_s_save_to_collection/b_s_save_to_collection_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'wish_main_model.dart';
export 'wish_main_model.dart';

class WishMainWidget extends StatefulWidget {
  const WishMainWidget({
    super.key,
    required this.selectedWishRow,
    bool? isProfile,
    bool? isFromAI,
  })  : isProfile = isProfile ?? false,
        isFromAI = isFromAI ?? false;

  final WishesRow? selectedWishRow;
  final bool isProfile;
  final bool isFromAI;

  @override
  State<WishMainWidget> createState() => _WishMainWidgetState();
}

class _WishMainWidgetState extends State<WishMainWidget>
    with TickerProviderStateMixin {
  late WishMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WishMainModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Wish_Main'});
    animationsMap.addAll({
      'stackOnPageLoadAnimation1': AnimationInfo(
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
      'stackOnPageLoadAnimation2': AnimationInfo(
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
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background.webp',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
                child: SizedBox(
                  height: 48.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0x9A000000),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                58.0, 0.0, 58.0, 0.0),
                            child: Text(
                              widget.selectedWishRow!.name!,
                              textAlign: TextAlign.center,
                              maxLines: 2,
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
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'WISH_MAIN_PAGE_NavBack_ON_TAP');
                                          logFirebaseEvent(
                                              'NavBack_navigate_back');
                                          context.safePop();
                                        },
                                        child: Stack(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Container(
                                              width: 38.0,
                                              height: 38.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0x9A000000),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                                border: Border.all(
                                                  color: const Color(0x33FFFFFF),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.chevron_left,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'stackOnPageLoadAnimation1']!),
                                    ),
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'WISH_MAIN_PAGE_Share_ON_TAP');
                                            if (widget.selectedWishRow?.link !=
                                                    null &&
                                                widget.selectedWishRow?.link !=
                                                    '') {
                                              logFirebaseEvent('Share_share');
                                              await Share.share(
                                                widget.selectedWishRow!.link!,
                                                sharePositionOrigin:
                                                    getWidgetBoundingBox(
                                                        context),
                                              );
                                            }
                                          },
                                          child: Stack(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Image.asset(
                                                'assets/images/Rectangle.webp',
                                                width: 38.0,
                                                height: 38.0,
                                                fit: BoxFit.cover,
                                              ),
                                              Container(
                                                width: 34.0,
                                                height: 34.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x9A000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.0),
                                                child: Image.asset(
                                                  'assets/images/Share.webp',
                                                  width: 18.0,
                                                  height: 18.0,
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'stackOnPageLoadAnimation2']!),
                                      ),
                                    ),
                                  ],
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
                  child: Stack(
                    children: [
                      Image.network(
                        widget.selectedWishRow!.photo!,
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.75,
                        fit: BoxFit.cover,
                      ),
                      if (widget.selectedWishRow?.link != null &&
                          widget.selectedWishRow?.link != '')
                        FlutterFlowWebView(
                          content: widget.selectedWishRow!.link!,
                          bypass: true,
                          height: MediaQuery.sizeOf(context).height * 0.75,
                          verticalScroll: false,
                          horizontalScroll: false,
                        ),
                    ],
                  ),
                ),
              ),
              Builder(
                builder: (context) => Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 45.0),
                  child: FutureBuilder<List<WishesRow>>(
                    future: WishesTable().querySingleRow(
                      queryFn: (q) => q
                          .eq(
                            'pair',
                            FFAppState().pairID,
                          )
                          .eq(
                            'parent_uuid',
                            widget.selectedWishRow?.uuid,
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
                      List<WishesRow> askForADateWishesRowList = snapshot.data!;
                      final askForADateWishesRow =
                          askForADateWishesRowList.isNotEmpty
                              ? askForADateWishesRowList.first
                              : null;
                      return wrapWithModel(
                        model: _model.askForADateModel,
                        updateCallback: () => setState(() {}),
                        child: PinkButtonWidget(
                          text: () {
                            if (widget.isFromAI) {
                              return 'Add to Wishlist';
                            } else if (widget.isProfile ||
                                (askForADateWishesRow != null) ||
                                (widget.selectedWishRow?.pair ==
                                    FFAppState().pairID)) {
                              return 'Ask for a Date';
                            } else {
                              return 'Add to Wishlist';
                            }
                          }(),
                          currentAction: () async {
                            logFirebaseEvent(
                                'WISH_MAIN_PAGE_AskForADate_CALLBACK');
                            var shouldSetState = false;
                            if (widget.isFromAI) {
                              logFirebaseEvent('AskForADate_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: BSSaveToCollectionWidget(
                                          selectedWishRow:
                                              widget.selectedWishRow,
                                          isFromWebview: true,
                                          isFromAI: widget.isFromAI,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              if (shouldSetState) setState(() {});
                              return;
                            }
                            if (widget.isProfile ||
                                (askForADateWishesRow != null)) {
                              logFirebaseEvent('AskForADate_backend_call');
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
                              shouldSetState = true;
                              if (_model.partnerRow!.isNotEmpty) {
                                logFirebaseEvent('AskForADate_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: BSAskDayWidget(
                                            selectedWishRow:
                                                widget.selectedWishRow!,
                                            partnerID:
                                                _model.partnerRow!.first.id,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                logFirebaseEvent('AskForADate_alert_dialog');
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
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: const AlertDialogWarningWidget(
                                            title: 'No partner selected !',
                                            subtitle:
                                                'Please add your partner from the profile',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              }
                            } else {
                              logFirebaseEvent('AskForADate_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: BSSaveToCollectionWidget(
                                          selectedWishRow:
                                              widget.selectedWishRow,
                                          isFromWebview: true,
                                          isFromAI: widget.isFromAI,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }

                            if (shouldSetState) setState(() {});
                          },
                        ),
                      );
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
