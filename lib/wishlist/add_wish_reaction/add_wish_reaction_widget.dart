import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_wish_reaction_model.dart';
export 'add_wish_reaction_model.dart';

class AddWishReactionWidget extends StatefulWidget {
  const AddWishReactionWidget({
    super.key,
    required this.selectedWishRow,
    this.selectedWishReaction,
  });

  final WishesRow? selectedWishRow;
  final WishReactionsRow? selectedWishReaction;

  @override
  State<AddWishReactionWidget> createState() => _AddWishReactionWidgetState();
}

class _AddWishReactionWidgetState extends State<AddWishReactionWidget>
    with TickerProviderStateMixin {
  late AddWishReactionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddWishReactionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Add_Wish_Reaction'});
    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
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
            color: FlutterFlowTheme.of(context).primaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background.webp',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 47.0, 16.0, 0.0),
                child: Container(
                  height: 38.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'ADD_WISH_REACTION_PAGE_NavBack_ON_TAP');
                            logFirebaseEvent('NavBack_navigate_back');
                            context.safePop();
                          },
                          child: Stack(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            children: [
                              Container(
                                width: 38.0,
                                height: 38.0,
                                decoration: BoxDecoration(
                                  color: Color(0x9A000000),
                                  borderRadius: BorderRadius.circular(14.0),
                                  border: Border.all(
                                    color: Color(0x33FFFFFF),
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
                            animationsMap['stackOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Add wish\nReaction',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nuckle',
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 36.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                      useGoogleFonts: false,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(60.0, 24.0, 60.0, 24.0),
                child: Container(
                  width: 238.0,
                  height: 325.0,
                  constraints: BoxConstraints(
                    maxWidth: 230.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.selectedWishRow!.photo!,
                          width: 238.0,
                          height: 325.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          height: 77.0,
                          decoration: BoxDecoration(
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
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
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
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 16.0, 0.0, 0.0),
                          child: FutureBuilder<List<UsersRow>>(
                            future: UsersTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'id',
                                widget.selectedWishRow?.createdBy,
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
                              List<UsersRow> userInfoUsersRowList =
                                  snapshot.data!;
                              final userInfoUsersRow =
                                  userInfoUsersRowList.isNotEmpty
                                      ? userInfoUsersRowList.first
                                      : null;
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (userInfoUsersRow?.avatar != null &&
                                      userInfoUsersRow?.avatar != '')
                                    Container(
                                      width: 18.0,
                                      height: 18.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 300),
                                        fadeOutDuration:
                                            Duration(milliseconds: 300),
                                        imageUrl: userInfoUsersRow!.avatar!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (userInfoUsersRow?.firstName != null &&
                                      userInfoUsersRow?.firstName != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        userInfoUsersRow!.firstName!,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
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
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 6.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FutureBuilder<List<CollectionsRow>>(
                                future: CollectionsTable().querySingleRow(
                                  queryFn: (q) => q.eq(
                                    'uuid',
                                    widget.selectedWishRow?.collection,
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
                                  List<CollectionsRow> textCollectionsRowList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textCollectionsRow =
                                      textCollectionsRowList.isNotEmpty
                                          ? textCollectionsRowList.first
                                          : null;
                                  return Text(
                                    textCollectionsRow!.name!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: false,
                                          lineHeight: 1.4,
                                        ),
                                  );
                                },
                              ),
                              if (widget.selectedWishRow?.name != null &&
                                  widget.selectedWishRow?.name != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 9.0, 0.0, 0.0),
                                  child: Text(
                                    widget.selectedWishRow!.name!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
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
                              if (widget.selectedWishRow?.description != null &&
                                  widget.selectedWishRow?.description != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    widget.selectedWishRow!.description!,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color: Color(0x98FFFFFF),
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
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 45.0),
                child: FutureBuilder<List<ReactionImagesRow>>(
                  future: ReactionImagesTable().queryRows(
                    queryFn: (q) => q.order('rating', ascending: true),
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
                    List<ReactionImagesRow> rowReactionImagesRowList =
                        snapshot.data!;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(rowReactionImagesRowList.length,
                                (rowIndex) {
                          final rowReactionImagesRow =
                              rowReactionImagesRowList[rowIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'ADD_WISH_REACTION_Image_nqu5kvy3_ON_TAP');
                              if (widget.selectedWishReaction != null) {
                                logFirebaseEvent('Image_backend_call');
                                unawaited(
                                  () async {
                                    await WishReactionsTable().update(
                                      data: {
                                        'rating': rowReactionImagesRow.rating,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        widget.selectedWishReaction?.id,
                                      ),
                                    );
                                  }(),
                                );
                              } else {
                                logFirebaseEvent('Image_backend_call');
                                unawaited(
                                  () async {
                                    await WishReactionsTable().insert({
                                      'user': currentUserUid,
                                      'rating': rowReactionImagesRow.rating,
                                      'whish': widget.selectedWishRow?.uuid,
                                    });
                                  }(),
                                );
                              }

                              logFirebaseEvent('Image_backend_call');
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
                              if (_model.partnerRow!.length > 0) {
                                logFirebaseEvent('Image_backend_call');
                                unawaited(
                                  () async {
                                    await NotificationsTable().insert({
                                      'from_user': currentUserUid,
                                      'to_user': _model.partnerRow?.first?.id,
                                      'type': 'reaction',
                                      'details': <String, String>{
                                        'wish_id': widget.selectedWishRow!.uuid,
                                        'wish_image':
                                            widget.selectedWishRow!.photo!,
                                        'reaction_id': rowReactionImagesRow
                                            .rating
                                            .toString(),
                                      },
                                    });
                                  }(),
                                );
                              }
                              logFirebaseEvent('Image_navigate_back');
                              context.safePop();

                              setState(() {});
                            },
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 300),
                              fadeOutDuration: Duration(milliseconds: 300),
                              imageUrl: rowReactionImagesRow.imageLink!,
                              width: 53.0,
                              height: 53.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        })
                            .divide(SizedBox(width: 27.0))
                            .addToStart(SizedBox(width: 16.0))
                            .addToEnd(SizedBox(width: 16.0)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
