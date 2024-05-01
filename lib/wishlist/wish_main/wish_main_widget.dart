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
import 'package:flutter/scheduler.dart';
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
    bool? isProfile,
    bool? isFromAI,
    required this.selectedWishID,
  })  : isProfile = isProfile ?? false,
        isFromAI = isFromAI ?? false;

  final bool isProfile;
  final bool isFromAI;
  final String? selectedWishID;

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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WISH_MAIN_PAGE_Wish_Main_ON_INIT_STATE');
      logFirebaseEvent('Wish_Main_update_page_state');
      _model.selectedWishID = widget.selectedWishID;
      logFirebaseEvent('Wish_Main_backend_call');
      _model.selectedWishRow = await WishesTable().queryRows(
        queryFn: (q) => q.eq(
          'uuid',
          _model.selectedWishID,
        ),
      );
      logFirebaseEvent('Wish_Main_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('Wish_Main_update_page_state');
      setState(() {
        _model.isLoading = false;
      });
    });

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
        body: Builder(
          builder: (context) {
            if (!_model.isLoading) {
              return Container(
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
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
                                child: Visibility(
                                  visible: _model.selectedWishRow != null &&
                                      (_model.selectedWishRow)!.isNotEmpty,
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        58.0, 0.0, 58.0, 0.0),
                                    child: Text(
                                      _model.selectedWishRow!.first.name!,
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'WISH_MAIN_PAGE_NavBack_ON_TAP');
                                                logFirebaseEvent(
                                                    'NavBack_navigate_back');
                                                context.safePop();
                                              },
                                              child: Stack(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Container(
                                                    width: 38.0,
                                                    height: 38.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0x9A000000),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14.0),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0x33FFFFFF),
                                                      ),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_left,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'WISH_MAIN_PAGE_Share_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Share_share');
                                                  await Share.share(
                                                    'https://flaresapp.page.link/?link=https://flaresapp.page.link/wishMain?selectedWishID=${widget.selectedWishID}&apn=com.geex.arts.flares&ibi=com.geex.arts.flares',
                                                    sharePositionOrigin:
                                                        getWidgetBoundingBox(
                                                            context),
                                                  );
                                                },
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
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
                                                        color:
                                                            const Color(0x9A000000),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 20.0),
                        child: Stack(
                          children: [
                            if (_model.selectedWishRow != null &&
                                (_model.selectedWishRow)!.isNotEmpty)
                              Image.network(
                                _model.selectedWishRow!.first.photo!,
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.75,
                                fit: BoxFit.cover,
                              ),
                            if ((_model.selectedWishRow != null &&
                                    (_model.selectedWishRow)!.isNotEmpty) &&
                                (_model.selectedWishRow?.first.link != null &&
                                    _model.selectedWishRow?.first.link != ''))
                              FlutterFlowWebView(
                                content: _model.selectedWishRow!.first.link!,
                                bypass: true,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.75,
                                verticalScroll: false,
                                horizontalScroll: false,
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.selectedWishRow != null &&
                        (_model.selectedWishRow)!.isNotEmpty)
                      Builder(
                        builder: (context) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 45.0),
                          child: FutureBuilder<List<WishesRow>>(
                            future: WishesTable().querySingleRow(
                              queryFn: (q) => q
                                  .eq(
                                    'pair',
                                    FFAppState().pairID,
                                  )
                                  .eq(
                                    'parent_uuid',
                                    _model.selectedWishRow?.first.parentUuid !=
                                                null &&
                                            _model.selectedWishRow?.first
                                                    .parentUuid !=
                                                ''
                                        ? _model
                                            .selectedWishRow?.first.parentUuid
                                        : _model.selectedWishRow?.first.uuid,
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
                                      color: FlutterFlowTheme.of(context)
                                          .pinkButton,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<WishesRow> askForADateWishesRowList =
                                  snapshot.data!;
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
                                        (_model.selectedWishRow?.first.pair ==
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
                                      logFirebaseEvent(
                                          'AskForADate_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: BSSaveToCollectionWidget(
                                                  selectedWishRow: _model
                                                      .selectedWishRow?.first,
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
                                      logFirebaseEvent(
                                          'AskForADate_backend_call');
                                      _model.partnerRow =
                                          await UsersTable().queryRows(
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
                                        logFirebaseEvent(
                                            'AskForADate_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: BSAskDayWidget(
                                                    selectedWishRow: _model
                                                        .selectedWishRow!.first,
                                                    partnerID: _model
                                                        .partnerRow!.first.id,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      } else {
                                        logFirebaseEvent(
                                            'AskForADate_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment: const AlignmentDirectional(
                                                      0.0, -1.0)
                                                  .resolve(Directionality.of(
                                                      context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child:
                                                      const AlertDialogWarningWidget(
                                                    title:
                                                        'No partner selected !',
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
                                      logFirebaseEvent(
                                          'AskForADate_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: BSSaveToCollectionWidget(
                                                  selectedWishRow: _model
                                                      .selectedWishRow?.first,
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
              );
            } else {
              return Visibility(
                visible: _model.isLoading,
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Container(
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
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
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
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
