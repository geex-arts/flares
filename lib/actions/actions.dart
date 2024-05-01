import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/board/b_s_turn_notifications/b_s_turn_notifications_widget.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_add_from_browser/b_s_add_from_browser_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future pairInvitationRowAction(
  BuildContext context, {
  required bool? isFromProfile,
}) async {
  List<PairsInvitationsRow>? currentPairInvitesRows;
  PairsInvitationsRow? pairInvitationRow;

  logFirebaseEvent('pairInvitationRowAction_backend_call');
  currentPairInvitesRows = await PairsInvitationsTable().queryRows(
    queryFn: (q) => q
        .eq(
          'pair',
          FFAppState().pairID,
        )
        .eq(
          'status',
          'pending',
        ),
  );
  if (currentPairInvitesRows.isNotEmpty) {
    logFirebaseEvent('pairInvitationRowAction_navigate_to');

    context.pushNamed(
      'Invite_Partner_Onb',
      queryParameters: {
        'pairInvitationRow': serializeParam(
          currentPairInvitesRows.first,
          ParamType.SupabaseRow,
        ),
        'isFromProfile': serializeParam(
          isFromProfile,
          ParamType.bool,
        ),
      }.withoutNulls,
    );
  } else {
    logFirebaseEvent('pairInvitationRowAction_backend_call');
    pairInvitationRow = await PairsInvitationsTable().insert({
      'status': 'pending',
      'pair_code': random_data.randomString(
        9,
        9,
        true,
        true,
        true,
      ),
      'pair': FFAppState().pairID,
    });
    logFirebaseEvent('pairInvitationRowAction_navigate_to');

    context.pushNamed(
      'Invite_Partner_Onb',
      queryParameters: {
        'pairInvitationRow': serializeParam(
          pairInvitationRow,
          ParamType.SupabaseRow,
        ),
        'isFromProfile': serializeParam(
          isFromProfile,
          ParamType.bool,
        ),
      }.withoutNulls,
    );
  }
}

Future loadFromBrowserAction(
  BuildContext context, {
  String? url,
}) async {
  ApiCallResponse? apiParseResult;

  while (true) {
    if (url != null && url != '') {
      logFirebaseEvent('loadFromBrowserAction_update_app_state');
      FFAppState().update(() {
        FFAppState().currentUrl = url;
      });
      if (true) {
        logFirebaseEvent('loadFromBrowserAction_backend_call');
        apiParseResult = await ParseSiteCall.call(
          url: url,
        );
        if ((apiParseResult.succeeded ?? true)) {
          logFirebaseEvent('loadFromBrowserAction_bottom_sheet');
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            useSafeArea: true,
            context: context,
            builder: (context) {
              return WebViewAware(
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: BSAddFromBrowserWidget(
                    parsedURLJson: (apiParseResult?.jsonBody ?? ''),
                  ),
                ),
              );
            },
          );
        } else {
          logFirebaseEvent('loadFromBrowserAction_alert_dialog');
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, -1.0)
                    .resolve(Directionality.of(context)),
                child: WebViewAware(
                  child: AlertDialogWarningWidget(
                    title: 'Something went wrong',
                    subtitle: (apiParseResult?.bodyText ?? ''),
                  ),
                ),
              );
            },
          );
        }

        logFirebaseEvent('loadFromBrowserAction_update_app_state');
        FFAppState().previousUrl = url;
        FFAppState().currentUrl = '';
      }
    } else {
      logFirebaseEvent('loadFromBrowserAction_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
    }

    logFirebaseEvent('loadFromBrowserAction_wait__delay');
    await Future.delayed(const Duration(milliseconds: 1000));
  }
}

Future authRoutine(BuildContext context) async {
  String? fcmToken;
  List<UsersRow>? userAuthCopyCopy;

  logFirebaseEvent('authRoutine_custom_action');
  await actions.getPushPermission();
  logFirebaseEvent('authRoutine_custom_action');
  fcmToken = await actions.getFCMToken();
  logFirebaseEvent('authRoutine_custom_action');
  await actions.initializeCustomerIo(
    currentUserEmail,
  );
  logFirebaseEvent('authRoutine_custom_action');
  await actions.identifyRevenueCat(
    currentUserUid,
  );
  logFirebaseEvent('authRoutine_backend_call');
  await UsersTable().update(
    data: {
      'fcmToken': fcmToken,
    },
    matchingRows: (rows) => rows.eq(
      'id',
      currentUserUid,
    ),
  );
  logFirebaseEvent('authRoutine_backend_call');
  userAuthCopyCopy = await UsersTable().queryRows(
    queryFn: (q) => q.eq(
      'id',
      currentUserUid,
    ),
  );
  if (userAuthCopyCopy.first.pair != null &&
      userAuthCopyCopy.first.pair != '') {
    logFirebaseEvent('authRoutine_update_app_state');
    FFAppState().pairID = userAuthCopyCopy.first.pair!;
    logFirebaseEvent('authRoutine_navigate_to');

    context.goNamed('Explore');
  } else {
    logFirebaseEvent('authRoutine_navigate_to');

    context.goNamed('More');
  }
}

Future signinRoutine(
  BuildContext context, {
  String? pairCode,
}) async {
  String? fcmToken;
  List<PairsInvitationsRow>? foundPairingRow;

  logFirebaseEvent('signinRoutine_custom_action');
  await actions.getPushPermission();
  logFirebaseEvent('signinRoutine_custom_action');
  fcmToken = await actions.getFCMToken();
  logFirebaseEvent('signinRoutine_backend_call');
  await UsersTable().insert({
    'id': currentUserUid,
    'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
    'email': currentUserEmail,
    'fcmToken': fcmToken,
  });
  logFirebaseEvent('signinRoutine_custom_action');
  await actions.initializeCustomerIo(
    currentUserEmail,
  );
  logFirebaseEvent('signinRoutine_custom_action');
  await actions.identifyRevenueCat(
    currentUserUid,
  );
  logFirebaseEvent('signinRoutine_update_app_state');
  FFAppState().pairID = '';
  if (pairCode != null && pairCode != '') {
    logFirebaseEvent('signinRoutine_backend_call');
    foundPairingRow = await PairsInvitationsTable().queryRows(
      queryFn: (q) => q
          .eq(
            'status',
            'pending',
          )
          .eq(
            'pair_code',
            pairCode,
          ),
    );
    if (foundPairingRow.isNotEmpty) {
      logFirebaseEvent('signinRoutine_backend_call');
      unawaited(
        () async {
          await UsersTable().update(
            data: {
              'pair': foundPairingRow?.first.pair,
            },
            matchingRows: (rows) => rows.eq(
              'id',
              currentUserUid,
            ),
          );
        }(),
      );
      logFirebaseEvent('signinRoutine_backend_call');
      unawaited(
        () async {
          await PairsInvitationsTable().update(
            data: {
              'status': 'accepted',
            },
            matchingRows: (rows) => rows.eq(
              'uuid',
              foundPairingRow?.first.uuid,
            ),
          );
        }(),
      );
      logFirebaseEvent('signinRoutine_update_app_state');
      FFAppState().pairID = foundPairingRow.first.pair!;
      logFirebaseEvent('signinRoutine_bottom_sheet');
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return WebViewAware(
            child: Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.85,
                child: const BSTurnNotificationsWidget(),
              ),
            ),
          );
        },
      );

      return;
    }
  }
  logFirebaseEvent('signinRoutine_navigate_to');

  context.goNamed('Create_Couple_Profile');
}
