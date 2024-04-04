import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/d_add_wishes/d_add_wishes_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'my_profile_model.dart';
export 'my_profile_model.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({super.key});

  @override
  State<MyProfileWidget> createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget>
    with TickerProviderStateMixin {
  late MyProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: const Offset(-200.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: const Offset(200.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1200.ms,
          begin: const Offset(4.0, 4.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'gridViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'stackOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: const Color(0x80FFFFFF),
          angle: 0.524,
        ),
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          color: const Color(0x80FFFFFF),
          angle: 0.524,
        ),
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          color: const Color(0x80FFFFFF),
          angle: 0.524,
        ),
        ShimmerEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 600.ms,
          color: const Color(0x80FFFFFF),
          angle: 0.524,
        ),
      ],
    ),
    'stackOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'stackOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'stackOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProfileModel());
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
          child: FutureBuilder<List<UsersRow>>(
            future: UsersTable().querySingleRow(
              queryFn: (q) => q.eq(
                'id',
                currentUserUid,
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
              List<UsersRow> stackUsersRowList = snapshot.data!;
              final stackUsersRow =
                  stackUsersRowList.isNotEmpty ? stackUsersRowList.first : null;
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 85.0, 0.0, 0.0),
                          child: FutureBuilder<List<PairsRow>>(
                            future: PairsTable().querySingleRow(
                              queryFn: (q) => q,
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
                              final columnPairsRow =
                                  columnPairsRowList.isNotEmpty
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
                                                  Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      '',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 1.0),
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
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            width: 34.0,
                                                            height: 34.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation1']!),
                                                          Container(
                                                            width: 34.0,
                                                            height: 34.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    Image.asset(
                                                                  'assets/images/prof2.webp',
                                                                ).image,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation2']!),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 1.0),
                                                    child: const Icon(
                                                      FFIcons.kshape,
                                                      color: Color(0xFFFF2C96),
                                                      size: 14.0,
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'iconOnPageLoadAnimation']!),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  46.0, 33.0, 56.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '2 years',
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
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    '10',
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
                                      valueOrDefault<String>(
                                        columnPairsRow?.pairName,
                                        'no pair name',
                                      ),
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
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
                                          FFIcons.kgroup,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 16.0,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                    Container(
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x18FFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            14.0, 2.0, 14.0, 0.0),
                                        child: Text(
                                          'Restaurants',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x18FFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            14.0, 2.0, 14.0, 0.0),
                                        child: Text(
                                          'Concerts',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x18FFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            14.0, 2.0, 14.0, 0.0),
                                        child: Text(
                                          'Men’s Fashion',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(width: 4.0))
                                      .addToStart(const SizedBox(width: 16.0))
                                      .addToEnd(const SizedBox(width: 16.0)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 10.0, 8.0, 0.0),
                              child: FutureBuilder<List<WishesRow>>(
                                future: WishesTable().queryRows(
                                  queryFn: (q) => q,
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
                                  List<WishesRow> mainWishesRowList =
                                      snapshot.data!;
                                  return GridView.builder(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      10.0,
                                      0,
                                      120.0,
                                    ),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 10.0,
                                      childAspectRatio: 0.75,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: mainWishesRowList.length,
                                    itemBuilder: (context, mainIndex) {
                                      final mainWishesRow =
                                          mainWishesRowList[mainIndex];
                                      return SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                mainWishesRow.photo!,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 77.0,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xA5000000),
                                                    Colors.transparent
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.transparent,
                                                      Color(0xA6000000)
                                                    ],
                                                    stops: [0.0, 1.0],
                                                    begin: AlignmentDirectional(
                                                        0.0, -1.0),
                                                    end: AlignmentDirectional(
                                                        0, 1.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 16.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 18.0,
                                                    height: 18.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      '',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      mainWishesRow.uuid,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nuckle',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 10.0,
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
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                            ))
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 13.0, 10.0, 0.0),
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFFA4A39E),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      FFIcons.kaddReaction,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      size: 15.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 13.0, 10.0, 0.0),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFA4A39E),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: const Color(0xFFFF2C96),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(6.0),
                                                    child: Image.network(
                                                      '',
                                                      width: 14.0,
                                                      height: 14.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 6.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    mainWishesRow.collection!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                          lineHeight: 1.4,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 9.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      mainWishesRow.name!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nuckle',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.4,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      mainWishesRow
                                                          .description!,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Nuckle',
                                                            color: const Color(
                                                                0x98FFFFFF),
                                                            fontSize: 10.0,
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
                                      ).animateOnPageLoad(animationsMap[
                                          'stackOnPageLoadAnimation1']!);
                                    },
                                  ).animateOnPageLoad(animationsMap[
                                      'gridViewOnPageLoadAnimation']!);
                                },
                              ),
                            ),
                          ],
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
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 16.0,
                            sigmaY: 16.0,
                          ),
                          child: Container(
                            width: 200.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: const Color(0x1AFFFFFF),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  26.0, 0.0, 26.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    FFIcons.kworld,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 18.0,
                                  ),
                                  Icon(
                                    FFIcons.kchat,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 18.0,
                                  ),
                                  Container(
                                    width: 22.0,
                                    height: 22.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/prof3.webp',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
                    child: SizedBox(
                      height: 38.0,
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
                                  child: Stack(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
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
                                        FFIcons.kbell,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 16.0,
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'stackOnPageLoadAnimation2']!),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 18.0,
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'stackOnPageLoadAnimation3']!),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
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
                                                    child: const DAddWishesWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
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
                                            'stackOnPageLoadAnimation4']!),
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
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 47.0, 16.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 16.0,
                            sigmaY: 16.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0x14FFFFFF),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 33.0,
                                    height: 33.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/logoRound.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Flares is made for two 💖',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'Share your magic link to get started!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  color: const Color(0x98FFFFFF),
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        height: 31.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .pinkButton,
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                        ),
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Share',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: false,
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
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
