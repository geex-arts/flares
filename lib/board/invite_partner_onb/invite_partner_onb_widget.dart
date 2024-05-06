import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/board/b_s_turn_notifications/b_s_turn_notifications_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'invite_partner_onb_model.dart';
export 'invite_partner_onb_model.dart';

class InvitePartnerOnbWidget extends StatefulWidget {
  const InvitePartnerOnbWidget({
    super.key,
    this.pairInvitationRow,
    bool? isFromProfile,
  }) : isFromProfile = isFromProfile ?? false;

  final PairsInvitationsRow? pairInvitationRow;
  final bool isFromProfile;

  @override
  State<InvitePartnerOnbWidget> createState() => _InvitePartnerOnbWidgetState();
}

class _InvitePartnerOnbWidgetState extends State<InvitePartnerOnbWidget>
    with TickerProviderStateMixin {
  late InvitePartnerOnbModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvitePartnerOnbModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Invite_Partner_Onb'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('INVITE_PARTNER_ONB_Invite_Partner_Onb_ON');
      logFirebaseEvent('Invite_Partner_Onb_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      logFirebaseEvent('Invite_Partner_Onb_update_app_state');
      FFAppState().isProfileSet = true;
    });

    _model.sendCodeFieldTextController ??= TextEditingController();
    _model.sendCodeFieldFocusNode ??= FocusNode();

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
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 47.0, 16.0, 0.0),
                child: SizedBox(
                  height: 38.0,
                  child: Stack(
                    children: [
                      if (!widget.isFromProfile)
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'INVITE_PARTNER_ONB_PAGE_Skip_ON_TAP');
                              logFirebaseEvent('Skip_navigate_to');

                              context.pushNamed('Create_Couple_Profile');
                            },
                            child: Container(
                              height: 38.0,
                              decoration: BoxDecoration(
                                color: const Color(0x17FFFFFF),
                                borderRadius: BorderRadius.circular(21.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Skip',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 16.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'INVITE_PARTNER_ONB_PAGE_NavBack_ON_TAP');
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
                                  color: const Color(0x16000000),
                                  borderRadius: BorderRadius.circular(14.0),
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
                            animationsMap['stackOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Invite your Partner',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Nuckle',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: false,
                                lineHeight: 1.4,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            widget.pairInvitationRow != null
                                ? 'Your partner will receive a link to  download to the Flares app. He\'ll then use the code to pair your profiles'
                                : 'Enter your partner\'s code to pair your profiles',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nuckle',
                                  color: const Color(0x9AFFFFFF),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                  lineHeight: 1.4,
                                ),
                          ),
                        ),
                        if (widget.pairInvitationRow != null)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0x0DFFFFFF),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 10.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Share your pairing code',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'My code: ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        color:
                                                            const Color(0x98FFFFFF),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault<String>(
                                                    widget.pairInvitationRow
                                                        ?.pairCode,
                                                    'FLARES990',
                                                  ),
                                                  style: const TextStyle(
                                                    color: Color(0xFFFF2C96),
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Nuckle',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'INVITE_PARTNER_ONB_PAGE_CopyIcon_ON_TAP');
                                                logFirebaseEvent(
                                                    'CopyIcon_copy_to_clipboard');
                                                await Clipboard.setData(
                                                    ClipboardData(
                                                        text: widget
                                                            .pairInvitationRow!
                                                            .pairCode!));
                                              },
                                              child: const Icon(
                                                Icons.content_copy,
                                                color: Color(0xFFFF2C96),
                                                size: 18.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.sharemyinvitelinkModel,
                                          updateCallback: () => setState(() {}),
                                          child: PinkButtonWidget(
                                            text: 'Share my invite link',
                                            currentAction: () async {
                                              logFirebaseEvent(
                                                  'INVITE_PARTNER_ONB_Sharemyinvitelink_CAL');
                                              logFirebaseEvent(
                                                  'Sharemyinvitelink_share');
                                              await Share.share(
                                                'https://flaresapp.page.link/myProfile?pairCode=${_model.pairingCode}&apn=com.geex.arts.flares&ibi=com.geex.arts.flares',
                                                sharePositionOrigin:
                                                    getWidgetBoundingBox(
                                                        context),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        if (widget.pairInvitationRow != null)
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 6.0, 16.0, 0.0),
                                          child: Text(
                                            'Or',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  color: FlutterFlowTheme.of(
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
                              0.0, 30.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0x0DFFFFFF),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 10.0, 16.0, 16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'I have my partners code',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.sendCodeFieldTextController,
                                      focusNode: _model.sendCodeFieldFocusNode,
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        hintText: 'Enter code',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color: const Color(0x98FFFFFF),
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        errorStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Nuckle',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: false,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .pinkButton,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0x19FFFFFF),
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                20.0, 14.0, 20.0, 14.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: false,
                                          ),
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .pinkButton,
                                      validator: _model
                                          .sendCodeFieldTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  if (_model.codeNotFound)
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          'The pairing code not found',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 16.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.sendPairingCodeModel,
                                      updateCallback: () => setState(() {}),
                                      child: PinkButtonWidget(
                                        text: 'Send Pairing Code',
                                        currentAction: () async {
                                          logFirebaseEvent(
                                              'INVITE_PARTNER_ONB_SendPairingCode_CALLB');
                                          logFirebaseEvent(
                                              'SendPairingCode_update_page_state');
                                          setState(() {
                                            _model.codeNotFound = false;
                                          });
                                          logFirebaseEvent(
                                              'SendPairingCode_backend_call');
                                          _model.foundPairingRow =
                                              await PairsInvitationsTable()
                                                  .queryRows(
                                            queryFn: (q) => q
                                                .eq(
                                                  'status',
                                                  'pending',
                                                )
                                                .eq(
                                                  'pair_code',
                                                  _model
                                                      .sendCodeFieldTextController
                                                      .text,
                                                ),
                                          );
                                          if (_model.foundPairingRow != null &&
                                              (_model.foundPairingRow)!
                                                  .isNotEmpty) {
                                            logFirebaseEvent(
                                                'SendPairingCode_backend_call');
                                            unawaited(
                                              () async {
                                                await UsersTable().update(
                                                  data: {
                                                    'pair': _model
                                                        .foundPairingRow
                                                        ?.first
                                                        .pair,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    currentUserUid,
                                                  ),
                                                );
                                              }(),
                                            );
                                            logFirebaseEvent(
                                                'SendPairingCode_backend_call');
                                            unawaited(
                                              () async {
                                                await PairsInvitationsTable()
                                                    .update(
                                                  data: {
                                                    'status': 'accepted',
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'uuid',
                                                    _model.foundPairingRow
                                                        ?.first.uuid,
                                                  ),
                                                );
                                              }(),
                                            );
                                            logFirebaseEvent(
                                                'SendPairingCode_update_app_state');
                                            FFAppState().pairID = _model
                                                .foundPairingRow!.first.pair!;
                                            if (widget.isFromProfile) {
                                              logFirebaseEvent(
                                                  'SendPairingCode_navigate_back');
                                              context.safePop();
                                            } else {
                                              logFirebaseEvent(
                                                  'SendPairingCode_bottom_sheet');
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
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.85,
                                                          child:
                                                              const BSTurnNotificationsWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'SendPairingCode_update_page_state');
                                            setState(() {
                                              _model.codeNotFound = true;
                                            });
                                          }

                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]
                          .addToStart(const SizedBox(height: 30.0))
                          .addToEnd(const SizedBox(height: 60.0)),
                    ),
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
