import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pair_header_model.dart';
export 'pair_header_model.dart';

class PairHeaderWidget extends StatefulWidget {
  const PairHeaderWidget({
    super.key,
    this.parameter1,
    required this.parameter2,
    this.parameter3,
  });

  final String? parameter1;
  final String? parameter2;
  final String? parameter3;

  @override
  State<PairHeaderWidget> createState() => _PairHeaderWidgetState();
}

class _PairHeaderWidgetState extends State<PairHeaderWidget>
    with TickerProviderStateMixin {
  late PairHeaderModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PairHeaderModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 85.0, 0.0, 0.0),
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
                  color: FlutterFlowTheme.of(context).pinkButton,
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
          final columnPairsRow =
              columnPairsRowList.isNotEmpty ? columnPairsRowList.first : null;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 124.0,
                          child: Stack(
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      columnPairsRow!.photo!,
                                    ),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              if (!true)
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        columnPairsRow.photo!,
                                      ),
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation1']!),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: FutureBuilder<List<UsersRow>>(
                                  future: UsersTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'pair',
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
                                            color: FlutterFlowTheme.of(context)
                                                .pinkButton,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UsersRow> containerUsersRowList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 7.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if (containerUsersRowList
                                                            .where((e) =>
                                                                e.id ==
                                                                currentUserUid)
                                                            .toList()
                                                            .first
                                                            .avatar !=
                                                        null &&
                                                    containerUsersRowList
                                                            .where((e) =>
                                                                e.id ==
                                                                currentUserUid)
                                                            .toList()
                                                            .first
                                                            .avatar !=
                                                        '') {
                                                  return Container(
                                                    width: 34.0,
                                                    height: 34.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          containerUsersRowList
                                                              .where((e) =>
                                                                  e.id ==
                                                                  currentUserUid)
                                                              .toList()
                                                              .first
                                                              .avatar!,
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation2']!);
                                                } else {
                                                  return Container(
                                                    width: 34.0,
                                                    height: 34.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0x1AFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation3']!);
                                                }
                                              },
                                            ),
                                            Builder(
                                              builder: (context) {
                                                if ((containerUsersRowList
                                                            .length >
                                                        1) &&
                                                    (containerUsersRowList
                                                                .where((e) =>
                                                                    e.id !=
                                                                    currentUserUid)
                                                                .toList()
                                                                .first
                                                                .avatar !=
                                                            null &&
                                                        containerUsersRowList
                                                                .where((e) =>
                                                                    e.id !=
                                                                    currentUserUid)
                                                                .toList()
                                                                .first
                                                                .avatar !=
                                                            '')) {
                                                  return Container(
                                                    width: 34.0,
                                                    height: 34.0,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          containerUsersRowList
                                                              .where((e) =>
                                                                  e.id !=
                                                                  currentUserUid)
                                                              .toList()
                                                              .first
                                                              .avatar!,
                                                        ),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation4']!);
                                                } else if (containerUsersRowList
                                                        .length ==
                                                    1) {
                                                  return Container(
                                                    width: 34.0,
                                                    height: 34.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0x4D000000),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons
                                                          .person_add_alt_outlined,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 17.0,
                                                    ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'containerOnPageLoadAnimation5']!);
                                                } else {
                                                  return Visibility(
                                                    visible: false,
                                                    child: Container(
                                                      width: 34.0,
                                                      height: 34.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0x4D000000),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    100.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation6']!),
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
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: const Icon(
                                  FFIcons.klike,
                                  color: Color(0xFFFF2C96),
                                  size: 14.0,
                                ).animateOnPageLoad(
                                    animationsMap['iconOnPageLoadAnimation']!),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(46.0, 33.0, 56.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.apiResultc17Copy =
                                  await GenerateAiSimiliarWishCall.call(
                                budget: 'elite',
                                city: 'Almaty',
                                collectionId:
                                    '8e367689-4000-48dc-9c86-747c5c62518a',
                              );
                              if ((_model.apiResultc17Copy?.succeeded ??
                                  true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text((_model
                                                .apiResultc17Copy?.bodyText ??
                                            '')),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                                    return var1.replaceAll(' ago', '');
                                  }(dateTimeFormat(
                                      'relative', columnPairsRow.pairSince!)),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: false,
                                        lineHeight: 1.4,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'Together',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: const Color(0x9AFFFFFF),
                                          fontSize: 12.0,
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
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.apiResultc16Copy =
                                  await GenerateAiWishCall.call(
                                city: 'Moscow',
                                budget: 'friendly',
                                interest: 'any',
                              );
                              if ((_model.apiResultc16Copy?.succeeded ??
                                  true)) {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text((_model
                                                .apiResultc16Copy?.bodyText ??
                                            '')),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                                  future: DatesTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'pair',
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
                                            color: FlutterFlowTheme.of(context)
                                                .pinkButton,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<DatesRow> textDatesRowList =
                                        snapshot.data!;
                                    return Text(
                                      valueOrDefault<String>(
                                        textDatesRowList.length.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.4,
                                          ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'Dates',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: const Color(0x98FFFFFF),
                                          fontSize: 12.0,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Text(
                  columnPairsRow.pairName!,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Nuckle',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
    );
  }
}
