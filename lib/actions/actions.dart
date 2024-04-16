import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';

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
