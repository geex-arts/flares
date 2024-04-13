import '../database.dart';

class DatesTable extends SupabaseTable<DatesRow> {
  @override
  String get tableName => 'dates';

  @override
  DatesRow createRow(Map<String, dynamic> data) => DatesRow(data);
}

class DatesRow extends SupabaseDataRow {
  DatesRow(super.data);

  @override
  SupabaseTable get table => DatesTable();

  DateTime get dateTime => getField<DateTime>('date_time')!;
  set dateTime(DateTime value) => setField<DateTime>('date_time', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get wish => getField<String>('wish');
  set wish(String? value) => setField<String>('wish', value);

  String? get pair => getField<String>('pair');
  set pair(String? value) => setField<String>('pair', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
