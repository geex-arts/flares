import '../database.dart';

class DiscoveryCategoriesTable extends SupabaseTable<DiscoveryCategoriesRow> {
  @override
  String get tableName => 'discovery categories';

  @override
  DiscoveryCategoriesRow createRow(Map<String, dynamic> data) =>
      DiscoveryCategoriesRow(data);
}

class DiscoveryCategoriesRow extends SupabaseDataRow {
  DiscoveryCategoriesRow(super.data);

  @override
  SupabaseTable get table => DiscoveryCategoriesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
