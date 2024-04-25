import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_add_from_browser/b_s_add_from_browser_widget.dart';
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
  if (currentPairInvitesRows!.length > 0) {
    logFirebaseEvent('pairInvitationRowAction_navigate_to');

    context.pushNamed(
      'Invite_Partner_Onb',
      queryParameters: {
        'pairInvitationRow': serializeParam(
          currentPairInvitesRows?.first,
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
        FFAppState().currentUrl = url!;
      });
      if (true) {
        logFirebaseEvent('loadFromBrowserAction_backend_call');
        apiParseResult = await ParseSiteCall.call(
          url: url,
        );
        if ((apiParseResult?.succeeded ?? true)) {
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
                alignment: AlignmentDirectional(0.0, -1.0)
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
        FFAppState().previousUrl = url!;
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
