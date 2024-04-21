import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'notifications_list_model.dart';
export 'notifications_list_model.dart';

class NotificationsListWidget extends StatefulWidget {
  const NotificationsListWidget({
    super.key,
    required this.parameter8,
    required this.day,
  });

  final List<NotificationsRow>? parameter8;
  final String? day;

  @override
  State<NotificationsListWidget> createState() =>
      _NotificationsListWidgetState();
}

class _NotificationsListWidgetState extends State<NotificationsListWidget> {
  late NotificationsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.parameter8!.isNotEmpty,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${valueOrDefault<String>(
                    widget.day,
                    ' Today',
                  )} ',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nuckle',
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: false,
                      ),
                ),
                TextSpan(
                  text: valueOrDefault<String>(
                    widget.parameter8?.length.toString(),
                    '0',
                  ),
                  style: const TextStyle(
                    color: Color(0x9AFFFFFF),
                  ),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nuckle',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Builder(
            builder: (context) {
              final currentNotification = widget.parameter8!.toList();
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(
                  0,
                  20.0,
                  0,
                  0,
                ),
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: currentNotification.length,
                itemBuilder: (context, currentNotificationIndex) {
                  final currentNotificationItem =
                      currentNotification[currentNotificationIndex];
                  return Builder(
                    builder: (context) {
                      if (currentNotificationItem.type == 'reaction') {
                        return Container(
                          width: double.infinity,
                          height: 84.0,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FutureBuilder<List<UsersRow>>(
                                future: UsersTable().querySingleRow(
                                  queryFn: (q) => q.eq(
                                    'id',
                                    currentNotificationItem.fromUser,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 64.0,
                                        height: 64.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context).pink,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRow>
                                      conditionalBuilderUsersRowList =
                                      snapshot.data!;
                                  final conditionalBuilderUsersRow =
                                      conditionalBuilderUsersRowList.isNotEmpty
                                          ? conditionalBuilderUsersRowList.first
                                          : null;
                                  return Builder(
                                    builder: (context) {
                                      if (conditionalBuilderUsersRow?.avatar !=
                                              null &&
                                          conditionalBuilderUsersRow?.avatar !=
                                              '') {
                                        return Container(
                                          width: 64.0,
                                          height: 64.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            conditionalBuilderUsersRow!.avatar!,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          width: 64.0,
                                          height: 64.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your Partner',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                              lineHeight: 1.0,
                                            ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Left a reaction',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            const Color(0x9AFFFFFF),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                const TextSpan(
                                                  text: ' • ',
                                                  style: TextStyle(
                                                    color: Color(0x19FFFFFF),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: (String var1) {
                                                    return var1.replaceAll(
                                                        ' ago', '');
                                                  }(dateTimeFormat(
                                                      'relative',
                                                      currentNotificationItem
                                                          .createdAt)),
                                                  style: const TextStyle(
                                                    color: Color(0x65FFFFFF),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13.0,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            const Color(0x9AFFFFFF),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 13.0)),
                                  ),
                                ),
                              ),
                              Container(
                                width: 80.0,
                                height: 64.0,
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        child: Image.network(
                                          getJsonField(
                                            currentNotificationItem.details!,
                                            r'''$.wish_image''',
                                          ).toString(),
                                          width: 42.0,
                                          height: 64.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
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
                                            child: FutureBuilder<
                                                List<ReactionImagesRow>>(
                                              future: ReactionImagesTable()
                                                  .querySingleRow(
                                                queryFn: (q) => q.eq(
                                                  'rating',
                                                  int.parse(getJsonField(
                                                    currentNotificationItem
                                                        .details!,
                                                    r'''$.reaction_id''',
                                                  ).toString()),
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .pink,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ReactionImagesRow>
                                                    imageReactionImagesRowList =
                                                    snapshot.data!;
                                                final imageReactionImagesRow =
                                                    imageReactionImagesRowList
                                                            .isNotEmpty
                                                        ? imageReactionImagesRowList
                                                            .first
                                                        : null;
                                                return Image.network(
                                                  imageReactionImagesRow!
                                                      .imageLink!,
                                                  width: 14.0,
                                                  height: 14.0,
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          width: double.infinity,
                          height: 84.0,
                          decoration: const BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 64.0,
                                height: 64.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  getJsonField(
                                    currentNotificationItem.details!,
                                    r'''$.wish_image''',
                                  ).toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Invitation',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                              lineHeight: 1.0,
                                            ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 8.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Invited to ${getJsonField(
                                                    currentNotificationItem
                                                        .details,
                                                    r'''$.wish_name''',
                                                  ).toString()}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            const Color(0x9AFFFFFF),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                const TextSpan(
                                                  text: ' • ',
                                                  style: TextStyle(
                                                    color: Color(0x19FFFFFF),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: (String var1) {
                                                    return var1.replaceAll(
                                                        ' ago', '');
                                                  }(dateTimeFormat(
                                                      'relative',
                                                      currentNotificationItem
                                                          .createdAt)),
                                                  style: const TextStyle(
                                                    color: Color(0x65FFFFFF),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13.0,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            const Color(0x9AFFFFFF),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 13.0)),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'NOTIFICATIONS_LIST_Container_6yav5pkd_ON');
                                  logFirebaseEvent('Container_launch_u_r_l');
                                  await launchURL(getJsonField(
                                    currentNotificationItem.details!,
                                    r'''$.link''',
                                  ).toString());
                                },
                                child: Container(
                                  width: 80.0,
                                  height: 34.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).pinkButton,
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Open',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 11.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
