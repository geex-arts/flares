import '../database.dart';

class BannersTable extends SupabaseTable<BannersRow> {
  @override
  String get tableName => 'banners';

  @override
  BannersRow createRow(Map<String, dynamic> data) => BannersRow(data);
}

class BannersRow extends SupabaseDataRow {
  BannersRow(super.data);

  @override
  SupabaseTable get table => BannersTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get info => getField<String>('info');
  set info(String? value) => setField<String>('info', value);

  bool? get forSubscribed => getField<bool>('for_subscribed');
  set forSubscribed(bool? value) => setField<bool>('for_subscribed', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);
}
