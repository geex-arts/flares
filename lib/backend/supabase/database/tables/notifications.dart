import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get fromUser => getField<String>('from_user');
  set fromUser(String? value) => setField<String>('from_user', value);

  String? get toUser => getField<String>('to_user');
  set toUser(String? value) => setField<String>('to_user', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  dynamic? get details => getField<dynamic>('details');
  set details(dynamic? value) => setField<dynamic>('details', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
