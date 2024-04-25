import '../database.dart';

class ArticlesTable extends SupabaseTable<ArticlesRow> {
  @override
  String get tableName => 'articles';

  @override
  ArticlesRow createRow(Map<String, dynamic> data) => ArticlesRow(data);
}

class ArticlesRow extends SupabaseDataRow {
  ArticlesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ArticlesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String? get language => getField<String>('language');
  set language(String? value) => setField<String>('language', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  bool get featured => getField<bool>('featured')!;
  set featured(bool value) => setField<bool>('featured', value);
}
