import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(super.data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get avatar => getField<String>('avatar');
  set avatar(String? value) => setField<String>('avatar', value);

  String? get pair => getField<String>('pair');
  set pair(String? value) => setField<String>('pair', value);

  String? get fcmToken => getField<String>('fcmToken');
  set fcmToken(String? value) => setField<String>('fcmToken', value);

  DateTime get customerioLastUpdated =>
      getField<DateTime>('customerio_last_updated')!;
  set customerioLastUpdated(DateTime value) =>
      setField<DateTime>('customerio_last_updated', value);

  DateTime? get notificationsLastVisited =>
      getField<DateTime>('notifications_last_visited');
  set notificationsLastVisited(DateTime? value) =>
      setField<DateTime>('notifications_last_visited', value);

  bool? get pushPartnerUpdates => getField<bool>('push_partner_updates');
  set pushPartnerUpdates(bool? value) =>
      setField<bool>('push_partner_updates', value);

  bool? get pushRelationshipReminders =>
      getField<bool>('push_relationship_reminders');
  set pushRelationshipReminders(bool? value) =>
      setField<bool>('push_relationship_reminders', value);

  String? get currentFeeling => getField<String>('current_feeling');
  set currentFeeling(String? value) =>
      setField<String>('current_feeling', value);
}
