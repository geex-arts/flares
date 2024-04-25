import '../database.dart';

class FeelingsTable extends SupabaseTable<FeelingsRow> {
  @override
  String get tableName => 'feelings';

  @override
  FeelingsRow createRow(Map<String, dynamic> data) => FeelingsRow(data);
}

class FeelingsRow extends SupabaseDataRow {
  FeelingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FeelingsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
