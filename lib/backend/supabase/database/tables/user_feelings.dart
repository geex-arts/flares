import '../database.dart';

class UserFeelingsTable extends SupabaseTable<UserFeelingsRow> {
  @override
  String get tableName => 'user feelings';

  @override
  UserFeelingsRow createRow(Map<String, dynamic> data) => UserFeelingsRow(data);
}

class UserFeelingsRow extends SupabaseDataRow {
  UserFeelingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFeelingsTable();

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get customFeeling => getField<String>('custom feeling');
  set customFeeling(String? value) => setField<String>('custom feeling', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get feeling => getField<String>('feeling');
  set feeling(String? value) => setField<String>('feeling', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
