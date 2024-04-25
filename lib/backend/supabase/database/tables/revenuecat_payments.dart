import '../database.dart';

class RevenuecatPaymentsTable extends SupabaseTable<RevenuecatPaymentsRow> {
  @override
  String get tableName => 'revenuecat payments';

  @override
  RevenuecatPaymentsRow createRow(Map<String, dynamic> data) =>
      RevenuecatPaymentsRow(data);
}

class RevenuecatPaymentsRow extends SupabaseDataRow {
  RevenuecatPaymentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RevenuecatPaymentsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get productId => getField<String>('product_id');
  set productId(String? value) => setField<String>('product_id', value);

  String? get price => getField<String>('price');
  set price(String? value) => setField<String>('price', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get store => getField<String>('store');
  set store(String? value) => setField<String>('store', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  String get uuid => getField<String>('uuid')!;
  set uuid(String value) => setField<String>('uuid', value);

  String? get countryCode => getField<String>('country_code');
  set countryCode(String? value) => setField<String>('country_code', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
