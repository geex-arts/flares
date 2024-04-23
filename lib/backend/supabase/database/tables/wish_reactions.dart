import '../database.dart';

class WishReactionsTable extends SupabaseTable<WishReactionsRow> {
  @override
  String get tableName => 'wish reactions';

  @override
  WishReactionsRow createRow(Map<String, dynamic> data) =>
      WishReactionsRow(data);
}

class WishReactionsRow extends SupabaseDataRow {
  WishReactionsRow(super.data);

  @override
  SupabaseTable get table => WishReactionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get whish => getField<String>('whish');
  set whish(String? value) => setField<String>('whish', value);

  String get user => getField<String>('user')!;
  set user(String value) => setField<String>('user', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get rating => getField<int>('rating');
  set rating(int? value) => setField<int>('rating', value);
}
