import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
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
      FFAppState().currentUrl = url;
      if (FFAppState().currentUrl != FFAppState().previousUrl) {
        apiParseResult = await ParseSiteCall.call(
          url: FFAppState().testUrl,
        );
        if ((apiParseResult.succeeded ?? true)) {
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
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0.0, -1.0)
                    .resolve(Directionality.of(context)),
                child: const WebViewAware(
                  child: AlertDialogWarningWidget(
                    title: 'Something went wrong',
                    subtitle: 'Please try again later',
                  ),
                ),
              );
            },
          );
        }

        FFAppState().previousUrl = url;
        FFAppState().currentUrl = '';
      }
    } else {
      await Future.delayed(const Duration(milliseconds: 2000));
    }

    await Future.delayed(const Duration(milliseconds: 1000));
  }
}
