import '../database.dart';

class AiCategoryTable extends SupabaseTable<AiCategoryRow> {
  @override
  String get tableName => 'ai category';

  @override
  AiCategoryRow createRow(Map<String, dynamic> data) => AiCategoryRow(data);
}

class AiCategoryRow extends SupabaseDataRow {
  AiCategoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiCategoryTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
