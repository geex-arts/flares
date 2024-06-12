import '/backend/supabase/supabase.dart';
import '/components/card_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_add_wishes/b_s_add_wishes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'past_dates_model.dart';
export 'past_dates_model.dart';

class PastDatesWidget extends StatefulWidget {
  const PastDatesWidget({
    super.key,
    required this.pastDatesWishes,
  });

  final List<String>? pastDatesWishes;

  @override
  State<PastDatesWidget> createState() => _PastDatesWidgetState();
}

class _PastDatesWidgetState extends State<PastDatesWidget>
    with TickerProviderStateMixin {
  late PastDatesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PastDatesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Past_Dates'});
    animationsMap.addAll({
      'gridViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
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
                          const EdgeInsetsDirectional.fromSTEB(8.0, 100.0, 8.0, 0.0),
                      child: FutureBuilder<List<WishesRow>>(
                        future: WishesTable().queryRows(
                          queryFn: (q) => q
                              .in_(
                                'uuid',
                                widget.pastDatesWishes!,
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
                                      FlutterFlowTheme.of(context).pinkButton,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<WishesRow> mainWishesRowList = snapshot.data!;
                          return GridView.builder(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              10.0,
                              0,
                              0.0,
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
                              return CardWidget(
                                key: Key(
                                    'Key41g_${mainIndex}_of_${mainWishesRowList.length}'),
                                isMyProfile: false,
                                currentWishRow: mainWishesRow,
                              );
                            },
                          ).animateOnPageLoad(
                              animationsMap['gridViewOnPageLoadAnimation']!);
                        },
                      ),
                    ),
                  ].addToEnd(const SizedBox(height: 120.0)),
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
              wrapWithModel(
                model: _model.tabBarModel,
                updateCallback: () => setState(() {}),
                child: const TabBarWidget(
                  index: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
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
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'PAST_DATES_PAGE_NavBack_ON_TAP');
                                  logFirebaseEvent('NavBack_navigate_back');
                                  context.safePop();
                                },
                                child: Stack(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
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
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ],
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['stackOnPageLoadAnimation1']!),
                            ),
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
                                          FFIcons.ksettings,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 18.0,
                                        ),
                                      ],
                                    ).animateOnPageLoad(animationsMap[
                                        'stackOnPageLoadAnimation2']!),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'PAST_DATES_PAGE_Share_ON_TAP');
                                          logFirebaseEvent(
                                              'Share_bottom_sheet');
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
                                                    child: const BSAddWishesWidget(),
                                                  ),
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
                                                    BorderRadius.circular(12.0),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 2.0),
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
                              'Past Dates',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nuckle',
                                    fontSize: 25.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
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
            ],
          ),
        ),
      ),
    );
  }
}
