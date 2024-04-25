import '../database.dart';

class PlacesTable extends SupabaseTable<PlacesRow> {
  @override
  String get tableName => 'places';

  @override
  PlacesRow createRow(Map<String, dynamic> data) => PlacesRow(data);
}

class PlacesRow extends SupabaseDataRow {
  PlacesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlacesTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get country => getField<String>('country');
  set country(String? value) => setField<String>('country', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);
}
