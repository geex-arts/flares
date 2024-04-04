import '../database.dart';

class CollectionsTable extends SupabaseTable<CollectionsRow> {
  @override
  String get tableName => 'collections';

  @override
  CollectionsRow createRow(Map<String, dynamic> data) => CollectionsRow(data);
}

class CollectionsRow extends SupabaseDataRow {
  CollectionsRow(super.data);

  @override
  SupabaseTable get table => CollectionsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  bool? get visibility => getField<bool>('visibility');
  set visibility(bool? value) => setField<bool>('visibility', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get parent => getField<String>('parent');
  set parent(String? value) => setField<String>('parent', value);
}
