import '/backend/supabase/supabase.dart';
import '/components/floating_btn_widget.dart';
import '/components/generate_with_a_i_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/wishlist/b_s_add_wishes/b_s_add_wishes_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'category_p_model.dart';
export 'category_p_model.dart';

class CategoryPWidget extends StatefulWidget {
  const CategoryPWidget({
    super.key,
    this.selectedCategoryID,
  });

  final String? selectedCategoryID;

  @override
  State<CategoryPWidget> createState() => _CategoryPWidgetState();
}

class _CategoryPWidgetState extends State<CategoryPWidget>
    with TickerProviderStateMixin {
  late CategoryPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryPModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Category_P'});
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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: FutureBuilder<List<CollectionsRow>>(
          future: CollectionsTable().queryRows(
            queryFn: (q) => q.eq(
              'parent',
              widget.selectedCategoryID,
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
            List<CollectionsRow> containerCollectionsRowList = snapshot.data!;
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
                          child: FutureBuilder<List<CollectionsRow>>(
                            future: CollectionsTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'uuid',
                                widget.selectedCategoryID,
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
                              List<CollectionsRow> columnCollectionsRowList =
                                  snapshot.data!;
                              final columnCollectionsRow =
                                  columnCollectionsRowList.isNotEmpty
                                      ? columnCollectionsRowList.first
                                      : null;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (columnCollectionsRow?.photo != null &&
                                      columnCollectionsRow?.photo != '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CATEGORY_P_CircleImage_f30ufwvn_ON_TAP');
                                        logFirebaseEvent(
                                            'CircleImage_navigate_to');

                                        context.pushNamed('Category_P2');
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          columnCollectionsRow!.photo!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      columnCollectionsRow!.name!,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            useGoogleFonts: false,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 6.0, 0.0, 0.0),
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Last Updated ',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  color: Color(0x9AFFFFFF),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                          TextSpan(
                                            text: (String var1) {
                                              return var1.replaceAll(
                                                  ' ago', '');
                                            }(dateTimeFormat(
                                                'relative',
                                                columnCollectionsRow!
                                                    .createdAt)),
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: ' ago',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  color: Color(0x9AFFFFFF),
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        FutureBuilder<List<WishesRow>>(
                          future: WishesTable().queryRows(
                            queryFn: (q) => q
                                .in_(
                                  'collection',
                                  containerCollectionsRowList
                                      .map((e) => e.uuid)
                                      .toList(),
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
                            List<WishesRow> wishesListMainWishesRowList =
                                snapshot.data!;
                            return wrapWithModel(
                              model: _model.wishesListMainModel,
                              updateCallback: () => setState(() {}),
                              child: WishesListMainWidget(
                                isMyProfile: false,
                                wishesRowsParam: wishesListMainWishesRowList
                                    .where((e) =>
                                        e.parentUuid == null ||
                                        e.parentUuid == '')
                                    .toList(),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 0.0),
                          child: wrapWithModel(
                            model: _model.generateWithAIModel,
                            updateCallback: () => setState(() {}),
                            child: GenerateWithAIWidget(),
                          ),
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
                                        'CATEGORY_P_PAGE_Notify_ON_TAP');
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CATEGORY_P_PAGE_Share_ON_TAP');
                                            logFirebaseEvent(
                                                'Share_bottom_sheet');
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
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          BSAddWishesWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Stack(
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
                                            'stackOnPageLoadAnimation2']!),
                                      ),
                                    ],
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
