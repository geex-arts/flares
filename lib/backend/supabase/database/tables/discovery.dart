import '../database.dart';

class DiscoveryTable extends SupabaseTable<DiscoveryRow> {
  @override
  String get tableName => 'discovery';

  @override
  DiscoveryRow createRow(Map<String, dynamic> data) => DiscoveryRow(data);
}

class DiscoveryRow extends SupabaseDataRow {
  DiscoveryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiscoveryTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get collection => getField<String>('collection');
  set collection(String? value) => setField<String>('collection', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
