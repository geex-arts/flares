import '../database.dart';

class AiWishImagesTable extends SupabaseTable<AiWishImagesRow> {
  @override
  String get tableName => 'ai wish images';

  @override
  AiWishImagesRow createRow(Map<String, dynamic> data) => AiWishImagesRow(data);
}

class AiWishImagesRow extends SupabaseDataRow {
  AiWishImagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiWishImagesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get collection => getField<String>('collection');
  set collection(String? value) => setField<String>('collection', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
