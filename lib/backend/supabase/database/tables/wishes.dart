import '../database.dart';

class WishesTable extends SupabaseTable<WishesRow> {
  @override
  String get tableName => 'wishes';

  @override
  WishesRow createRow(Map<String, dynamic> data) => WishesRow(data);
}

class WishesRow extends SupabaseDataRow {
  WishesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WishesTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get visibily => getField<bool>('visibily');
  set visibily(bool? value) => setField<bool>('visibily', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get collection => getField<String>('collection');
  set collection(String? value) => setField<String>('collection', value);

  String? get pair => getField<String>('pair');
  set pair(String? value) => setField<String>('pair', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String? get copiedFrom => getField<String>('copied_from');
  set copiedFrom(String? value) => setField<String>('copied_from', value);
}
