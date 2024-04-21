import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_save_to_collection/b_s_save_to_collection_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'card_model.dart';
export 'card_model.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    bool? isMyProfile,
    required this.currentWishRow,
    this.reactionImagesRows,
  }) : isMyProfile = isMyProfile ?? false;

  final bool isMyProfile;
  final WishesRow? currentWishRow;
  final List<ReactionImagesRow>? reactionImagesRows;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late CardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'Wish_Main',
                queryParameters: {
                  'selectedWishRow': serializeParam(
                    widget.currentWishRow,
                    ParamType.SupabaseRow,
                  ),
                  'isProfile': serializeParam(
                    widget.isMyProfile,
                    ParamType.bool,
                  ),
                }.withoutNulls,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 300),
                fadeOutDuration: const Duration(milliseconds: 300),
                imageUrl: widget.currentWishRow!.photo!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 77.0,
            decoration: const BoxDecoration(
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
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: const BoxDecoration(
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 16.0, 0.0, 0.0),
            child: FutureBuilder<List<UsersRow>>(
              future: UsersTable().querySingleRow(
                queryFn: (q) => q.eq(
                  'id',
                  widget.currentWishRow?.createdBy,
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
                List<UsersRow> userInfoUsersRowList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final userInfoUsersRow = userInfoUsersRowList.isNotEmpty
                    ? userInfoUsersRowList.first
                    : null;
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'Couples_Profile',
                      queryParameters: {
                        'selectedPairID': serializeParam(
                          userInfoUsersRow?.pair,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (userInfoUsersRow?.avatar != null &&
                          userInfoUsersRow?.avatar != '')
                        Container(
                          width: 18.0,
                          height: 18.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: const Duration(milliseconds: 200),
                            fadeOutDuration: const Duration(milliseconds: 200),
                            imageUrl: userInfoUsersRow!.avatar!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      if (userInfoUsersRow?.firstName != null &&
                          userInfoUsersRow?.firstName != '')
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            userInfoUsersRow!.firstName!
                                .maybeHandleOverflow(maxChars: 19),
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
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 6.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 34.0, 0.0),
                    child: FutureBuilder<List<CollectionsRow>>(
                      future: CollectionsTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'uuid',
                          widget.currentWishRow?.collection,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 34.0, 0.0),
                    child: Text(
                      widget.currentWishRow!.name!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 34.0, 0.0),
                          child: Text(
                            widget.currentWishRow!.description!,
                            maxLines: 4,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nuckle',
                                  color: const Color(0x98FFFFFF),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: false,
                                  lineHeight: 1.4,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (widget.isMyProfile)
            Align(
              alignment: const AlignmentDirectional(1.0, -1.0),
              child: FutureBuilder<List<WishReactionsRow>>(
                future: WishReactionsTable().queryRows(
                  queryFn: (q) => q.eq(
                    'whish',
                    widget.currentWishRow?.uuid,
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
                  List<WishReactionsRow> containerWishReactionsRowList =
                      snapshot.data!;
                  return Container(
                    width: 62.0,
                    height: 44.0,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        if (containerWishReactionsRowList.isNotEmpty)
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0,
                                  13.0,
                                  valueOrDefault<double>(
                                    containerWishReactionsRowList
                                            .where(
                                                (e) => e.user != currentUserUid)
                                            .toList()
                                            .isNotEmpty
                                        ? 31.0
                                        : 10.0,
                                    0.0,
                                  ),
                                  0.0),
                              child: Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFA4A39E),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    if (containerWishReactionsRowList
                                        .where((e) => e.user == currentUserUid)
                                        .toList()
                                        .isNotEmpty) {
                                      return Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Image.network(
                                          widget
                                              .reactionImagesRows![
                                                  (containerWishReactionsRowList
                                                          .where((e) =>
                                                              e.user ==
                                                              currentUserUid)
                                                          .toList()
                                                          .first
                                                          .rating!) -
                                                      1]
                                              .imageLink!,
                                          width: 14.0,
                                          height: 14.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'Add_Wish_Reaction',
                                            queryParameters: {
                                              'selectedWishRow': serializeParam(
                                                widget.currentWishRow,
                                                ParamType.SupabaseRow,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Icon(
                                          FFIcons.kaddReaction,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 15.0,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (containerWishReactionsRowList
                            .where((e) => e.user != currentUserUid)
                            .toList()
                            .isNotEmpty)
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsets.all(6.0),
                                  child: Image.network(
                                    widget
                                        .reactionImagesRows![
                                            (containerWishReactionsRowList
                                                    .where((e) =>
                                                        e.user !=
                                                        currentUserUid)
                                                    .toList()
                                                    .first
                                                    .rating!) -
                                                1]
                                        .imageLink!,
                                    width: 14.0,
                                    height: 14.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (containerWishReactionsRowList.isEmpty)
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 13.0, 10.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'Add_Wish_Reaction',
                                    queryParameters: {
                                      'selectedWishRow': serializeParam(
                                        widget.currentWishRow,
                                        ParamType.SupabaseRow,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFA4A39E),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    FFIcons.kaddReaction,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          if (!(widget.isMyProfile ||
              (widget.currentWishRow?.pair == FFAppState().pairID)))
            Align(
              alignment: const AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                child: FutureBuilder<List<WishesRow>>(
                  future: WishesTable().queryRows(
                    queryFn: (q) => q
                        .eq(
                          'pair',
                          FFAppState().pairID,
                        )
                        .eq(
                          'copied_from',
                          widget.currentWishRow?.uuid,
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
                    List<WishesRow> addToCollectionWishesRowList =
                        snapshot.data!;
                    return Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: const Color(0x28FFFFFF),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Builder(
                        builder: (context) {
                          if (addToCollectionWishesRowList.isNotEmpty) {
                            return Icon(
                              FFIcons.kfcheck,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 15.0,
                            );
                          } else {
                            return InkWell(
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
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: BSSaveToCollectionWidget(
                                          selectedWishRow:
                                              widget.currentWishRow,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                FFIcons.kfolderAdd,
                                color: FlutterFlowTheme.of(context).info,
                                size: 15.0,
                              ),
                            );
                          }
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
  }
}
