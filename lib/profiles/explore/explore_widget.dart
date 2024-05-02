import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/card_widget.dart';
import '/components/floating_btn_widget.dart';
import '/components/tab_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'explore_model.dart';
export 'explore_model.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({super.key});

  @override
  State<ExploreWidget> createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  late ExploreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Explore'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EXPLORE_PAGE_Explore_ON_INIT_STATE');
      if (!(currentUserUid != '')) {
        logFirebaseEvent('Explore_navigate_to');

        context.goNamed('Onboarding');
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FutureBuilder<List<UsersRow>>(
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
                        List<UsersRow> containerUsersRowList = snapshot.data!;
                        final containerUsersRow =
                            containerUsersRowList.isNotEmpty
                                ? containerUsersRowList.first
                                : null;
                        return Container(
                          decoration: const BoxDecoration(),
                          child: FutureBuilder<List<BannersRow>>(
                            future: BannersTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'for_subscribed',
                                revenue_cat.activeEntitlementIds.isNotEmpty
                                    ? true
                                    : false,
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
                              List<BannersRow> containerBannersRowList =
                                  snapshot.data!;
                              final containerBannersRow =
                                  containerBannersRowList.isNotEmpty
                                      ? containerBannersRowList.first
                                      : null;
                              return Container(
                                decoration: const BoxDecoration(),
                                child: Visibility(
                                  visible: !containerUsersRow!.dismissedBanners
                                      .contains(containerBannersRow?.uuid),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 20.0, 16.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0x0EFFFFFF),
                                        image: DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          image: Image.network(
                                            containerBannersRow!.image!,
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: const Color(0x19FFFFFF),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  containerBannersRow.title!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 0.0, 0.0),
                                                  child: Text(
                                                    containerBannersRow.info!,
                                                    maxLines: 4,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color:
                                                              const Color(0x9AFFFFFF),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Flexible(
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'EXPLORE_PAGE_ContiniueButton_ON_TAP');
                                                            logFirebaseEvent(
                                                                'ContiniueButton_navigate_to');

                                                            context.pushNamed(
                                                              'Subscriptions',
                                                              queryParameters: {
                                                                'isFIrstTime':
                                                                    serializeParam(
                                                                  false,
                                                                  ParamType
                                                                      .bool,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          text: 'Continiue',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .pinkButton,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nuckle',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          1.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'EXPLORE_PAGE_DismissForeverButton_ON_TAP');
                                                            logFirebaseEvent(
                                                                'DismissForeverButton_backend_call');
                                                            await UsersTable()
                                                                .update(
                                                              data: {
                                                                'dismissed_banners': functions.addStringToList(
                                                                    containerUsersRow
                                                                        .dismissedBanners
                                                                        .toList(),
                                                                    containerBannersRow
                                                                        .uuid),
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'id',
                                                                currentUserUid,
                                                              ),
                                                            );
                                                            logFirebaseEvent(
                                                                'DismissForeverButton_update_app_state');
                                                            setState(() {});
                                                          },
                                                          text:
                                                              'Dismiss Forever',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        15.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: const Color(
                                                                0x32FFFFFF),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Nuckle',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          1.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 5.0)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        height: 125.0,
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<List<StoriesRow>>(
                          future: StoriesTable().queryRows(
                            queryFn: (q) => q.order('order', ascending: true),
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
                            List<StoriesRow> listViewStoriesRowList =
                                snapshot.data!;
                            return ListView.separated(
                              padding: const EdgeInsets.fromLTRB(
                                16.0,
                                0,
                                16.0,
                                0,
                              ),
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: listViewStoriesRowList.length,
                              separatorBuilder: (_, __) => const SizedBox(width: 9.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewStoriesRow =
                                    listViewStoriesRowList[listViewIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'EXPLORE_PAGE_Container_7jgycngs_ON_TAP');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.pushNamed(
                                      'Stories_View',
                                      queryParameters: {
                                        'selectedStories': serializeParam(
                                          listViewStoriesRow,
                                          ParamType.SupabaseRow,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 125.0,
                                    height: 125.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .pinkButton,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 117.0,
                                        height: 117.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                listViewStoriesRow.image!,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 1.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text(
                                                  listViewStoriesRow.title!,
                                                  maxLines: 4,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.4,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: FutureBuilder<List<PopularWishesRow>>(
                        future: PopularWishesTable().queryRows(
                          queryFn: (q) => q.order('popular_order'),
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
                          List<PopularWishesRow> containerPopularWishesRowList =
                              snapshot.data!;
                          return Container(
                            decoration: const BoxDecoration(),
                            child: FutureBuilder<List<WishesRow>>(
                              future: WishesTable().queryRows(
                                queryFn: (q) => q.in_(
                                  'uuid',
                                  containerPopularWishesRowList
                                      .map((e) => e.uuid)
                                      .withoutNulls
                                      .toList(),
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
                                List<WishesRow> containerWishesRowList =
                                    snapshot.data!;
                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Popular Wishlist',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
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
                                                    'EXPLORE_PAGE_RichText_cdc2pqwv_ON_TAP');
                                                logFirebaseEvent(
                                                    'RichText_navigate_to');

                                                context.pushNamed(
                                                  'Category_P2',
                                                  queryParameters: {
                                                    'popularWishes':
                                                        serializeParam(
                                                      containerPopularWishesRowList,
                                                      ParamType.SupabaseRow,
                                                      true,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'See all ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Nuckle',
                                                            color: const Color(
                                                                0x9AFFFFFF),
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                false,
                                                          ),
                                                    ),
                                                    const TextSpan(
                                                      text: '(',
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        containerPopularWishesRowList
                                                            .length
                                                            .toString(),
                                                        '0',
                                                      ),
                                                      style: const TextStyle(),
                                                    ),
                                                    const TextSpan(
                                                      text: ')',
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Container(
                                          height: 196.0,
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final containerVar =
                                                  containerPopularWishesRowList
                                                      .take(10)
                                                      .toList();
                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  16.0,
                                                  0,
                                                  16.0,
                                                  0,
                                                ),
                                                primary: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: containerVar.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(width: 8.0),
                                                itemBuilder: (context,
                                                    containerVarIndex) {
                                                  final containerVarItem =
                                                      containerVar[
                                                          containerVarIndex];
                                                  return Container(
                                                    width: 144.0,
                                                    height: 196.0,
                                                    decoration: const BoxDecoration(),
                                                    child: CardWidget(
                                                      key: Key(
                                                          'Keyxe6_${containerVarIndex}_of_${containerVar.length}'),
                                                      isMyProfile: false,
                                                      currentWishRow:
                                                          containerWishesRowList
                                                              .where((e) =>
                                                                  containerVarItem
                                                                      .uuid ==
                                                                  e.uuid)
                                                              .toList()
                                                              .first,
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
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 50.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/cput.webp',
                            width: 23.0,
                            height: 23.0,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Ask AI',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Nuckle',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0x0EFFFFFF),
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: const Color(0x19FFFFFF),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 18.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    14.0, 0.0, 14.0, 0.0),
                                child: FutureBuilder<List<AiQuestionsRow>>(
                                  future: AiQuestionsTable().queryRows(
                                    queryFn: (q) =>
                                        q.order('order', ascending: true),
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
                                    List<AiQuestionsRow>
                                        wrapAiQuestionsRowList = snapshot.data!;
                                    return Wrap(
                                      spacing: 16.0,
                                      runSpacing: 16.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(
                                          wrapAiQuestionsRowList.length,
                                          (wrapIndex) {
                                        final wrapAiQuestionsRow =
                                            wrapAiQuestionsRowList[wrapIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'EXPLORE_PAGE_Container_ykzt20u1_ON_TAP');
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              'Assistant_View',
                                              queryParameters: {
                                                'aiAssistantLink':
                                                    serializeParam(
                                                  'https://flaresapp.com/aiquestions?question=${wrapAiQuestionsRow.value}&userID=$currentUserUid',
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0x19FFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(
                                                wrapAiQuestionsRow.name!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 11.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    14.0, 30.0, 14.0, 18.0),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0x1AFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color:
                                                              const Color(0x80FFFFFF),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                hintText: 'Your question...',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color:
                                                              const Color(0x80FFFFFF),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 18.0,
                                                            20.0, 0.0),
                                                suffixIcon: Icon(
                                                  FFIcons.klike,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .pink,
                                                  size: 24.0,
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: 48.0,
                                            height: 48.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x1AFFFFFF),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              FFIcons.ksend,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EXPLORE_PAGE_Container_uizawb7z_ON_TAP');
                                        logFirebaseEvent(
                                            'Container_navigate_to');

                                        context.pushNamed(
                                          'Assistant_View',
                                          queryParameters: {
                                            'aiAssistantLink': serializeParam(
                                              'https://flaresapp.com/chat?userID=$currentUserUid',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 48.0,
                                        decoration: const BoxDecoration(),
                                      ),
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
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: FutureBuilder<List<DiscoveryCategoriesRow>>(
                        future: DiscoveryCategoriesTable().queryRows(
                          queryFn: (q) => q.order('order', ascending: true),
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
                          List<DiscoveryCategoriesRow>
                              containerDiscoveryCategoriesRowList =
                              snapshot.data!;
                          return Container(
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Discover Categories',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final currentCategory =
                                          containerDiscoveryCategoriesRowList
                                              .take(4)
                                              .toList();
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: List.generate(
                                                  currentCategory.length,
                                                  (currentCategoryIndex) {
                                            final currentCategoryItem =
                                                currentCategory[
                                                    currentCategoryIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EXPLORE_PAGE_Container_6n1qyvgx_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'Category_P',
                                                  queryParameters: {
                                                    'selectedCategory':
                                                        serializeParam(
                                                      currentCategoryItem,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                height: 45.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x19FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  3.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 39.0,
                                                        height: 39.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          currentCategoryItem
                                                              .image!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  7.0,
                                                                  0.0,
                                                                  13.0,
                                                                  0.0),
                                                      child: Text(
                                                        currentCategoryItem
                                                            .name!,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nuckle',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          })
                                              .divide(const SizedBox(width: 5.0))
                                              .addToStart(const SizedBox(width: 16.0))
                                              .addToEnd(const SizedBox(width: 16.0)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                if (containerDiscoveryCategoriesRowList.length >
                                    4)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final currentCategory2 =
                                            containerDiscoveryCategoriesRowList
                                                .where((e) => e.order! > 4)
                                                .toList();
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                                    currentCategory2.length,
                                                    (currentCategory2Index) {
                                              final currentCategory2Item =
                                                  currentCategory2[
                                                      currentCategory2Index];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'EXPLORE_PAGE_Container_xgpr6r3f_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Container_navigate_to');

                                                  context.pushNamed(
                                                    'Category_P',
                                                    queryParameters: {
                                                      'selectedCategory':
                                                          serializeParam(
                                                        currentCategory2Item,
                                                        ParamType.SupabaseRow,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Container(
                                                  height: 45.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0x19FFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    3.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 39.0,
                                                          height: 39.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            currentCategory2Item
                                                                .image!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    7.0,
                                                                    0.0,
                                                                    13.0,
                                                                    0.0),
                                                        child: Text(
                                                          currentCategory2Item
                                                              .name!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Nuckle',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })
                                                .divide(const SizedBox(width: 5.0))
                                                .addToStart(
                                                    const SizedBox(width: 16.0))
                                                .addToEnd(
                                                    const SizedBox(width: 16.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: FutureBuilder<List<ArticlesRow>>(
                        future: ArticlesTable().queryRows(
                          queryFn: (q) => q.order('created_at'),
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
                          List<ArticlesRow> containerArticlesRowList =
                              snapshot.data!;
                          return Container(
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Relations',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 328.0,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final currentArticle =
                                            containerArticlesRowList
                                                .where((e) => e.featured)
                                                .toList();
                                        return ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            16.0,
                                            0,
                                            16.0,
                                            0,
                                          ),
                                          primary: false,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: currentArticle.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(width: 9.0),
                                          itemBuilder:
                                              (context, currentArticleIndex) {
                                            final currentArticleItem =
                                                currentArticle[
                                                    currentArticleIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EXPLORE_PAGE_Container_dprw4o5x_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'Stories_View',
                                                  queryParameters: {
                                                    'selectedArticle':
                                                        serializeParam(
                                                      currentArticleItem,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: 205.0,
                                                height: 318.0,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  24.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          currentArticleItem
                                                              .image!,
                                                          width: 205.0,
                                                          height: 189.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    if (currentArticleItem
                                                                .category !=
                                                            null &&
                                                        currentArticleItem
                                                                .category !=
                                                            '')
                                                      Text(
                                                        (currentArticleItem
                                                                .category!)
                                                            .toUpperCase(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nuckle',
                                                              color: const Color(
                                                                  0xFFADADAF),
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        currentArticleItem
                                                            .title!,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nuckle',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  23.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'd MMM yyyy',
                                                            currentArticleItem
                                                                .createdAt),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nuckle',
                                                              color: const Color(
                                                                  0xFFADADAF),
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 30.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final currentArticle2 =
                                            containerArticlesRowList
                                                .where((e) => !e.featured)
                                                .toList();
                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 0.74,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: currentArticle2.length,
                                          itemBuilder:
                                              (context, currentArticle2Index) {
                                            final currentArticle2Item =
                                                currentArticle2[
                                                    currentArticle2Index];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EXPLORE_PAGE_Container_jqgzmp6c_ON_TAP');
                                                logFirebaseEvent(
                                                    'Container_navigate_to');

                                                context.pushNamed(
                                                  'Stories_View',
                                                  queryParameters: {
                                                    'selectedArticle':
                                                        serializeParam(
                                                      currentArticle2Item,
                                                      ParamType.SupabaseRow,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: 205.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          currentArticle2Item
                                                              .image!,
                                                          width: 205.0,
                                                          height: 104.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    if (currentArticle2Item
                                                                .category !=
                                                            null &&
                                                        currentArticle2Item
                                                                .category !=
                                                            '')
                                                      Text(
                                                        (currentArticle2Item
                                                                .category!)
                                                            .toUpperCase(),
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nuckle',
                                                              color: const Color(
                                                                  0xFFADADAF),
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        currentArticle2Item
                                                            .title!,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Nuckle',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                            'd MMM yyyy',
                                                            currentArticle2Item
                                                                .createdAt),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Nuckle',
                                                              color: const Color(
                                                                  0xFFADADAF),
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
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
                          );
                        },
                      ),
                    ),
                  ]
                      .addToStart(const SizedBox(height: 110.0))
                      .addToEnd(const SizedBox(height: 120.0)),
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
                  index: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
                child: SizedBox(
                  height: 38.0,
                  child: Stack(
                    children: [
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
                              'Explore',
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
              wrapWithModel(
                model: _model.floatingBtnModel,
                updateCallback: () => setState(() {}),
                child: const FloatingBtnWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
