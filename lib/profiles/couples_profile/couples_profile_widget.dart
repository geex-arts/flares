import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/floating_btn_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'couples_profile_model.dart';
export 'couples_profile_model.dart';

class CouplesProfileWidget extends StatefulWidget {
  const CouplesProfileWidget({
    super.key,
    required this.selectedPairID,
  });

  final String? selectedPairID;

  @override
  State<CouplesProfileWidget> createState() => _CouplesProfileWidgetState();
}

class _CouplesProfileWidgetState extends State<CouplesProfileWidget>
    with TickerProviderStateMixin {
  late CouplesProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CouplesProfileModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Couples_Profile'});
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
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
            begin: Offset(-200.0, 0.0),
            end: Offset(0.0, 0.0),
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
            begin: Offset(-200.0, 0.0),
            end: Offset(0.0, 0.0),
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
            begin: Offset(200.0, 0.0),
            end: Offset(0.0, 0.0),
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
            begin: Offset(200.0, 0.0),
            end: Offset(0.0, 0.0),
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
            begin: Offset(4.0, 4.0),
            end: Offset(1.0, 1.0),
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FutureBuilder<List<UsersRow>>(
          future: UsersTable().queryRows(
            queryFn: (q) => q.eq(
              'pair',
              widget.selectedPairID,
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
            List<UsersRow> containerUsersRowList = snapshot.data!;
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
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 85.0, 0.0, 0.0),
                          child: FutureBuilder<List<PairsRow>>(
                            future: PairsTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'uuid',
                                widget.selectedPairID,
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
                              List<PairsRow> columnPairsRowList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final columnPairsRow =
                                  columnPairsRowList.isNotEmpty
                                      ? columnPairsRowList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 17.0, 0.0, 0.0),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 0.0, 32.0, 0.0),
                                            child: Container(
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
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          columnPairsRow!
                                                              .photo!,
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
                                                          image:
                                                              CachedNetworkImageProvider(
                                                            columnPairsRow!
                                                                .photo!,
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation1']!),
                                                  if (containerUsersRowList
                                                          .length >
                                                      1)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                    if (containerUsersRowList.first.avatar !=
                                                                            null &&
                                                                        containerUsersRowList.first.avatar !=
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
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image:
                                                                                CachedNetworkImageProvider(
                                                                              containerUsersRowList.first.avatar!,
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
                                                                          color:
                                                                              Color(0x34FFFFFF),
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
                                                                    if ((containerUsersRowList.length >
                                                                            1) &&
                                                                        (containerUsersRowList.last.avatar !=
                                                                                null &&
                                                                            containerUsersRowList.last.avatar !=
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
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image:
                                                                                CachedNetworkImageProvider(
                                                                              containerUsersRowList.last.avatar!,
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
                                                                    } else {
                                                                      return Container(
                                                                        width:
                                                                            34.0,
                                                                        height:
                                                                            34.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x34FFFFFF),
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
                                                                              'containerOnPageLoadAnimation5']!);
                                                                    }
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Icon(
                                                              FFIcons.klike,
                                                              color: Color(
                                                                  0xFFFF2C96),
                                                              size: 14.0,
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'iconOnPageLoadAnimation']!),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                  logFirebaseEvent(
                                                      'COUPLES_PROFILE_Column_r351k9zb_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_backend_call');
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
                                                    logFirebaseEvent(
                                                        'Column_alert_dialog');
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
                                                                child:
                                                                    Text('Ok'),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      (String var1) {
                                                        return var1.replaceAll(
                                                            ' ago', '');
                                                      }(dateTimeFormat(
                                                          'relative',
                                                          columnPairsRow!
                                                              .pairSince!)),
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
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.4,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Together',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nuckle',
                                                              color: Color(
                                                                  0x9AFFFFFF),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                  logFirebaseEvent(
                                                      'COUPLES_PROFILE_Column_2r7cpr3v_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_backend_call');
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
                                                    logFirebaseEvent(
                                                        'Column_alert_dialog');
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
                                                                child:
                                                                    Text('Ok'),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FutureBuilder<
                                                        List<DatesRow>>(
                                                      future: DatesTable()
                                                          .queryRows(
                                                        queryFn: (q) => q.eq(
                                                          'pair',
                                                          widget.selectedPairID,
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
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                          valueOrDefault<
                                                              String>(
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Dates',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nuckle',
                                                              color: Color(
                                                                  0x98FFFFFF),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      columnPairsRow!.pairName!,
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
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'COUPLES_PROFILE_Container_5echtx3o_ON_TA');
                                      logFirebaseEvent(
                                          'Container_update_page_state');
                                      setState(() {
                                        _model.selectedCollectionID = null;
                                      });
                                    },
                                    child: Container(
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          _model.selectedCollectionID == null ||
                                                  _model.selectedCollectionID ==
                                                      ''
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : Color(0x18FFFFFF),
                                          Color(0x18FFFFFF),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 2.0, 14.0, 0.0),
                                        child: Text(
                                          'All Wishes',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color: valueOrDefault<Color>(
                                                  _model.selectedCollectionID ==
                                                              null ||
                                                          _model.selectedCollectionID ==
                                                              ''
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
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
                                            widget.selectedPairID,
                                          )
                                          .eq(
                                            'visibility',
                                            true,
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'COUPLES_PROFILE_Container_r0xv75vw_ON_TA');
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              setState(() {
                                                _model.selectedCollectionID =
                                                    categoryRowCollectionsRow
                                                        .uuid;
                                              });
                                            },
                                            child: Container(
                                              height: 37.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.selectedCollectionID ==
                                                          categoryRowCollectionsRow
                                                              .uuid
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : Color(0x18FFFFFF),
                                                  Color(0x18FFFFFF),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 2.0, 14.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    categoryRowCollectionsRow
                                                        .name,
                                                    'Category',
                                                  ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nuckle',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.selectedCollectionID ==
                                                                      categoryRowCollectionsRow
                                                                          .uuid
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                            ),
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
                                            ),
                                          );
                                        }).divide(SizedBox(width: 4.0)),
                                      );
                                    },
                                  ),
                                ]
                                    .divide(SizedBox(width: 4.0))
                                    .addToStart(SizedBox(width: 16.0))
                                    .addToEnd(SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                        ),
                        FutureBuilder<List<WishesRow>>(
                          future: WishesTable().queryRows(
                            queryFn: (q) => q
                                .eq(
                                  'pair',
                                  widget.selectedPairID,
                                )
                                .eq(
                                  'visibily',
                                  true,
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
                                    color:
                                        FlutterFlowTheme.of(context).pinkButton,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<WishesRow> wishesListWishesRowList =
                                snapshot.data!;
                            return wrapWithModel(
                              model: _model.wishesListModel,
                              updateCallback: () => setState(() {}),
                              child: WishesListMainWidget(
                                wishesRowsParam:
                                    _model.selectedCollectionID != null &&
                                            _model.selectedCollectionID != ''
                                        ? wishesListWishesRowList
                                            .where((e) =>
                                                e.collection ==
                                                _model.selectedCollectionID)
                                            .toList()
                                        : wishesListWishesRowList,
                                isMyProfile: false,
                              ),
                            );
                          },
                        ),
                      ].addToEnd(SizedBox(height: 120.0)),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: 116.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.transparent, Color(0xA6000000)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.tabBarModel,
                    updateCallback: () => setState(() {}),
                    child: TabBarWidget(),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
                    child: Container(
                      height: 38.0,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                                    logFirebaseEvent(
                                        'COUPLES_PROFILE_PAGE_Notify_ON_TAP');
                                    logFirebaseEvent('Notify_navigate_to');

                                    context.pushNamed('Notifications');
                                  },
                                  child: Container(
                                    width: 42.0,
                                    height: 38.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Image.asset(
                                            'assets/images/Rectangle.webp',
                                            width: 38.0,
                                            height: 38.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 34.0,
                                              height: 34.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x9A000000),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Icon(
                                                FFIcons.kbell,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Container(
                                            width: 18.0,
                                            height: 13.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
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
                                ).animateOnPageLoad(animationsMap[
                                    'stackOnPageLoadAnimation1']!),
                                Expanded(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
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
                                                color: Color(0x9A000000),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                            Icon(
                                              FFIcons.ksettings,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 18.0,
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'stackOnPageLoadAnimation2']!),
                                      Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'COUPLES_PROFILE_PAGE_Share_ON_TAP');
                                              logFirebaseEvent('Share_share');
                                              await Share.share(
                                                'https://flaresapp.page.link/?link=https://flaresapp.page.link/couplesProfile?selectedPairID=${widget.selectedPairID}&apn=com.geex.arts.flares&ibi=com.geex.arts.flares',
                                                sharePositionOrigin:
                                                    getWidgetBoundingBox(
                                                        context),
                                              );
                                            },
                                            child: Stack(
                                              alignment: AlignmentDirectional(
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
                                                    color: Color(0x9A000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
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
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x9A000000),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 0.0),
                                child: Text(
                                  'Wishlist',
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
                  wrapWithModel(
                    model: _model.floatingBtnModel,
                    updateCallback: () => setState(() {}),
                    child: FloatingBtnWidget(),
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
