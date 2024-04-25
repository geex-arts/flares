import '../database.dart';

class AiQuestionsTable extends SupabaseTable<AiQuestionsRow> {
  @override
  String get tableName => 'ai questions';

  @override
  AiQuestionsRow createRow(Map<String, dynamic> data) => AiQuestionsRow(data);
}

class AiQuestionsRow extends SupabaseDataRow {
  AiQuestionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiQuestionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);
}
