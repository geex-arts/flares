import '../database.dart';

class PairsTable extends SupabaseTable<PairsRow> {
  @override
  String get tableName => 'pairs';

  @override
  PairsRow createRow(Map<String, dynamic> data) => PairsRow(data);
}

class PairsRow extends SupabaseDataRow {
  PairsRow(super.data);

  @override
  SupabaseTable get table => PairsTable();

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String? get pairName => getField<String>('pair_name');
  set pairName(String? value) => setField<String>('pair_name', value);

  DateTime? get firstDate => getField<DateTime>('first_date');
  set firstDate(DateTime? value) => setField<DateTime>('first_date', value);

  bool? get visibility => getField<bool>('visibility');
  set visibility(bool? value) => setField<bool>('visibility', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get pairSince => getField<DateTime>('pair_since');
  set pairSince(DateTime? value) => setField<DateTime>('pair_since', value);
}
