import '../database.dart';

class CountriesTable extends SupabaseTable<CountriesRow> {
  @override
  String get tableName => 'countries';

  @override
  CountriesRow createRow(Map<String, dynamic> data) => CountriesRow(data);
}

class CountriesRow extends SupabaseDataRow {
  CountriesRow(super.data);

  @override
  SupabaseTable get table => CountriesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get short => getField<String>('short');
  set short(String? value) => setField<String>('short', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
