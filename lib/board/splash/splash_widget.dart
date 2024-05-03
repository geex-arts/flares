import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({
    super.key,
    this.pairCode,
  });

  final String? pairCode;

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Splash'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SPLASH_PAGE_Splash_ON_INIT_STATE');
      logFirebaseEvent('Splash_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
      if (currentUserUid != '') {
        if (widget.pairCode != null && widget.pairCode != '') {
          logFirebaseEvent('Splash_update_app_state');
          FFAppState().pairCodeState = widget.pairCode!;
          logFirebaseEvent('Splash_backend_call');
          _model.foundPairingRow2 = await PairsInvitationsTable().queryRows(
            queryFn: (q) => q
                .eq(
                  'status',
                  'pending',
                )
                .eq(
                  'pair_code',
                  widget.pairCode,
                ),
          );
          if (_model.foundPairingRow2!.isNotEmpty) {
            logFirebaseEvent('Splash_backend_call');
            await UsersTable().update(
              data: {
                'pair': _model.foundPairingRow2?.first.pair,
              },
              matchingRows: (rows) => rows.eq(
                'id',
                currentUserUid,
              ),
            );
            logFirebaseEvent('Splash_backend_call');
            unawaited(
              () async {
                await PairsInvitationsTable().update(
                  data: {
                    'status': 'accepted',
                  },
                  matchingRows: (rows) => rows.eq(
                    'uuid',
                    _model.foundPairingRow2?.first.uuid,
                  ),
                );
              }(),
            );
            logFirebaseEvent('Splash_update_app_state');
            FFAppState().pairID = _model.foundPairingRow2!.first.pair!;
            FFAppState().pairCodeState = '';
          }
          logFirebaseEvent('Splash_navigate_to');

          context.goNamed('My_Profile');

          return;
        } else {
          logFirebaseEvent('Splash_navigate_to');

          context.goNamed('My_Profile');

          return;
        }
      } else {
        if (widget.pairCode != null && widget.pairCode != '') {
          logFirebaseEvent('Splash_update_app_state');
          setState(() {
            FFAppState().pairCodeState = widget.pairCode!;
          });
        }
      }

      logFirebaseEvent('Splash_navigate_to');

      context.goNamed(
        'Onboarding',
        queryParameters: {
          'pairCode': serializeParam(
            widget.pairCode != null && widget.pairCode != ''
                ? widget.pairCode
                : '',
            ParamType.String,
          ),
        }.withoutNulls,
      );
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 800.0.ms,
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
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/logo.webp',
                width: 252.0,
                height: 255.0,
                fit: BoxFit.cover,
              ),
            ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
          ),
        ),
      ),
    );
  }
}
