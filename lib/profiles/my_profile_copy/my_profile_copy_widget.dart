import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/floating_btn_widget.dart';
import '/components/generate_with_a_i_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_add_from_browser/b_s_add_from_browser_widget.dart';
import '/wishlist/b_s_add_wishes/b_s_add_wishes_widget.dart';
import '/wishlist/b_s_new_collection/b_s_new_collection_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'my_profile_copy_model.dart';
export 'my_profile_copy_model.dart';

class MyProfileCopyWidget extends StatefulWidget {
  const MyProfileCopyWidget({
    super.key,
    this.url,
  });

  final String? url;

  @override
  State<MyProfileCopyWidget> createState() => _MyProfileCopyWidgetState();
}

class _MyProfileCopyWidgetState extends State<MyProfileCopyWidget>
    with TickerProviderStateMixin {
  late MyProfileCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProfileCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      while (true) {
        if (widget.url != null && widget.url != '') {
          _model.currentURL = widget.url;
          if (true) {
            _model.apiParseResult = await ParseSiteCall.call(
              url: widget.url,
            );
            if ((_model.apiParseResult?.succeeded ?? true)) {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return WebViewAware(
                    child: GestureDetector(
                      onTap: () => _model.unfocusNode.canRequestFocus
                          ? FocusScope.of(context)
                              .requestFocus(_model.unfocusNode)
                          : FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: BSAddFromBrowserWidget(
                          parsedURLJson:
                              (_model.apiParseResult?.jsonBody ?? ''),
                        ),
                      ),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            } else {
              showDialog(
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
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: const AlertDialogWarningWidget(
                          title: 'Something went wrong',
                          subtitle: 'Please try again later',
                        ),
                      ),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            }

            _model.previousURL = _model.currentURL;
            _model.currentURL = null;
          }
        } else {
          await Future.delayed(const Duration(milliseconds: 2000));
        }

        await Future.delayed(const Duration(milliseconds: 1000));
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(-200.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(-200.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(200.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(200.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(200.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(4.0, 4.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
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
      'stackOnPageLoadAnimation3': AnimationInfo(
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

    return Builder(
      builder: (context) => GestureDetector(
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
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 85.0, 0.0, 0.0),
                        child: FutureBuilder<List<PairsRow>>(
                          future: PairsTable().querySingleRow(
                            queryFn: (q) => q.eq(
                              'uuid',
                              FFAppState().pairID,
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
                                    color:
                                        FlutterFlowTheme.of(context).pinkButton,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<PairsRow> columnPairsRowList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final columnPairsRow = columnPairsRowList.isNotEmpty
                                ? columnPairsRowList.first
                                : null;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 17.0, 0.0, 0.0),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          child: SizedBox(
                                            width: 100.0,
                                            height: 124.0,
                                            child: Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Couples_Profile',
                                                      queryParameters: {
                                                        'selectedPairID':
                                                            serializeParam(
                                                          FFAppState().pairID,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          columnPairsRow!
                                                              .photo!,
                                                        ),
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                ),
                                                if (!true)
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          columnPairsRow
                                                              .photo!,
                                                        ),
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation1']!),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: FutureBuilder<
                                                      List<UsersRow>>(
                                                    future:
                                                        UsersTable().queryRows(
                                                      queryFn: (q) => q.eq(
                                                        'pair',
                                                        FFAppState().pairID,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .pinkButton,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<UsersRow>
                                                          containerUsersRowList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      7.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (containerUsersRowList
                                                                              .where((e) =>
                                                                                  e.id ==
                                                                                  currentUserUid)
                                                                              .toList()
                                                                              .first
                                                                              .avatar !=
                                                                          null &&
                                                                      containerUsersRowList
                                                                              .where((e) => e.id == currentUserUid)
                                                                              .toList()
                                                                              .first
                                                                              .avatar !=
                                                                          '') {
                                                                    return Container(
                                                                      width:
                                                                          34.0,
                                                                      height:
                                                                          34.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              CachedNetworkImageProvider(
                                                                            containerUsersRowList.where((e) => e.id == currentUserUid).toList().first.avatar!,
                                                                          ),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation2']!);
                                                                  } else {
                                                                    return Container(
                                                                      width:
                                                                          34.0,
                                                                      height:
                                                                          34.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0x1AFFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation3']!);
                                                                  }
                                                                },
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  if ((containerUsersRowList
                                                                              .length >
                                                                          1) &&
                                                                      (containerUsersRowList.where((e) => e.id != currentUserUid).toList().first.avatar !=
                                                                              null &&
                                                                          containerUsersRowList.where((e) => e.id != currentUserUid).toList().first.avatar !=
                                                                              '')) {
                                                                    return Container(
                                                                      width:
                                                                          34.0,
                                                                      height:
                                                                          34.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              CachedNetworkImageProvider(
                                                                            containerUsersRowList.where((e) => e.id != currentUserUid).toList().first.avatar!,
                                                                          ),
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation4']!);
                                                                  } else if (containerUsersRowList
                                                                          .length ==
                                                                      1) {
                                                                    return Container(
                                                                      width:
                                                                          34.0,
                                                                      height:
                                                                          34.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0x4D000000),
                                                                        borderRadius:
                                                                            BorderRadius.circular(100.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .person_add_alt_outlined,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        size:
                                                                            17.0,
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                        animationsMap[
                                                                            'containerOnPageLoadAnimation5']!);
                                                                  } else {
                                                                    return Visibility(
                                                                      visible:
                                                                          false,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            34.0,
                                                                        height:
                                                                            34.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0x4D000000),
                                                                          borderRadius:
                                                                              BorderRadius.circular(100.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                      ).animateOnPageLoad(
                                                                              animationsMap['containerOnPageLoadAnimation6']!),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: const Icon(
                                                    FFIcons.klike,
                                                    color: Color(0xFFFF2C96),
                                                    size: 14.0,
                                                  ).animateOnPageLoad(animationsMap[
                                                      'iconOnPageLoadAnimation']!),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            46.0, 33.0, 56.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.apiResultc17Copy =
                                                    await GenerateAiSimiliarWishCall
                                                        .call(
                                                  budget: 'elite',
                                                  city: 'Almaty',
                                                  collectionId:
                                                      '8e367689-4000-48dc-9c86-747c5c62518a',
                                                );
                                                if ((_model.apiResultc17Copy
                                                        ?.succeeded ??
                                                    true)) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title: Text((_model
                                                                  .apiResultc17Copy
                                                                  ?.bodyText ??
                                                              '')),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: const Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }

                                                setState(() {});
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    (String var1) {
                                                      return var1.replaceAll(
                                                          ' ago', '');
                                                    }(dateTimeFormat(
                                                        'relative',
                                                        columnPairsRow
                                                            .pairSince!)),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.4,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Together',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nuckle',
                                                            color: const Color(
                                                                0x9AFFFFFF),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.4,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.apiResultc16Copy =
                                                    await GenerateAiWishCall
                                                        .call(
                                                  city: 'Moscow',
                                                  budget: 'friendly',
                                                  interest: 'any',
                                                );
                                                if ((_model.apiResultc16Copy
                                                        ?.succeeded ??
                                                    true)) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title: Text((_model
                                                                  .apiResultc16Copy
                                                                  ?.bodyText ??
                                                              '')),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: const Text('Ok'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }

                                                setState(() {});
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FutureBuilder<List<DatesRow>>(
                                                    future:
                                                        DatesTable().queryRows(
                                                      queryFn: (q) => q.eq(
                                                        'pair',
                                                        FFAppState().pairID,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .pinkButton,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<DatesRow>
                                                          textDatesRowList =
                                                          snapshot.data!;
                                                      return Text(
                                                        valueOrDefault<String>(
                                                          textDatesRowList
                                                              .length
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nuckle',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                              lineHeight: 1.4,
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Dates',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nuckle',
                                                            color: const Color(
                                                                0x98FFFFFF),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.4,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    columnPairsRow.pairName!,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 6.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.45,
                                                      child:
                                                          const BSNewCollectionWidget(),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 37.0,
                                          height: 37.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0x2AFFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            FFIcons.kaddCircle,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 18.0,
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
                                        setState(() {
                                          _model.selectedCollectionID = null;
                                        });
                                      },
                                      child: Container(
                                        height: 37.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  14.0, 2.0, 14.0, 0.0),
                                          child: Text(
                                            'All Wishes',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: false,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .pinkButton,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CollectionsRow>
                                            categoryRowCollectionsRowList =
                                            snapshot.data!;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              categoryRowCollectionsRowList
                                                  .length, (categoryRowIndex) {
                                            final categoryRowCollectionsRow =
                                                categoryRowCollectionsRowList[
                                                    categoryRowIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.selectedCollectionID =
                                                      categoryRowCollectionsRow
                                                          .uuid;
                                                });
                                              },
                                              child: Container(
                                                height: 37.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          14.0, 2.0, 14.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      categoryRowCollectionsRow
                                                          .name,
                                                      'Category',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.4,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).divide(const SizedBox(width: 4.0)),
                                        );
                                      },
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 4.0))
                                      .addToStart(const SizedBox(width: 16.0))
                                      .addToEnd(const SizedBox(width: 16.0)),
                                ),
                              ),
                            ),
                          ),
                          FutureBuilder<List<WishesRow>>(
                            future: WishesTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'pair',
                                    FFAppState().pairID,
                                  )
                                  .order('created_at'),
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
                              List<WishesRow> wishesListMainWishesRowList =
                                  snapshot.data!;
                              return wrapWithModel(
                                model: _model.wishesListMainModel,
                                updateCallback: () => setState(() {}),
                                child: WishesListMainWidget(
                                  wishesRowsParam:
                                      _model.selectedCollectionID != null &&
                                              _model.selectedCollectionID != ''
                                          ? wishesListMainWishesRowList
                                              .where((e) =>
                                                  e.collection ==
                                                  _model.selectedCollectionID)
                                              .toList()
                                          : wishesListMainWishesRowList,
                                  isMyProfile: true,
                                ),
                              );
                            },
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 0.0),
                              child: wrapWithModel(
                                model: _model.generateWithAIModel1,
                                updateCallback: () => setState(() {}),
                                child: const GenerateWithAIWidget(),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 24.0, 24.0, 16.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 73.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0x1AFFFFFF),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x0FFFFFFF),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              FFIcons.kdocumentSearch,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 22.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Add or import your first wish',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: SizedBox(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.85,
                                                            child:
                                                                const BSAddWishesWidget(),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          21.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .pinkButton,
                                                  ),
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 3.0, 12.0, 0.0),
                                                  child: Text(
                                                    'How it Works?',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: SizedBox(
                                    height: 24.0,
                                    child: Stack(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 1.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0x19FFFFFF),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: double.infinity,
                                              decoration: const BoxDecoration(),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 6.0, 16.0, 0.0),
                                                child: Text(
                                                  'Or',
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
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height: 1.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0x19FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 16.0, 24.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.generateWithAIModel2,
                                    updateCallback: () => setState(() {}),
                                    child: const GenerateWithAIWidget(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].addToEnd(const SizedBox(height: 120.0)),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Container(
                    width: double.infinity,
                    height: 116.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0xA6000000)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, -1.0),
                        end: AlignmentDirectional(0, 1.0),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.tabBarModel,
                    updateCallback: () => setState(() {}),
                    child: const TabBarWidget(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
                  child: SizedBox(
                    height: 39.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Notifications');
                                },
                                child: SizedBox(
                                  width: 42.0,
                                  height: 38.0,
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Image.asset(
                                          'assets/images/Rectangle.webp',
                                          width: 38.0,
                                          height: 38.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 34.0,
                                            height: 34.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0x9A000000),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Icon(
                                              FFIcons.kbell,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 16.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, -1.0),
                                        child: Container(
                                          width: 18.0,
                                          height: 13.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              '22',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['stackOnPageLoadAnimation1']!),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('Profile');
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
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                          Icon(
                                            FFIcons.ksettings,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 18.0,
                                          ),
                                        ],
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'stackOnPageLoadAnimation2']!),
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
                                            await Share.share(
                                              '#',
                                              sharePositionOrigin:
                                                  getWidgetBoundingBox(context),
                                            );
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
                                            'stackOnPageLoadAnimation3']!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                'Wishlist Copy',
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
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: wrapWithModel(
                    model: _model.floatingBtnModel,
                    updateCallback: () => setState(() {}),
                    child: const FloatingBtnWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
