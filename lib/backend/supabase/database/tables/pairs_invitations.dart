import '../database.dart';

class PairsInvitationsTable extends SupabaseTable<PairsInvitationsRow> {
  @override
  String get tableName => 'pairs invitations';

  @override
  PairsInvitationsRow createRow(Map<String, dynamic> data) =>
      PairsInvitationsRow(data);
}

class PairsInvitationsRow extends SupabaseDataRow {
  PairsInvitationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PairsInvitationsTable();

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get pairCode => getField<String>('pair_code');
  set pairCode(String? value) => setField<String>('pair_code', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get pair => getField<String>('pair');
  set pair(String? value) => setField<String>('pair', value);
}
