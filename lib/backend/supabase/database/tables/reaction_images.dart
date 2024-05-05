import '../database.dart';

class ReactionImagesTable extends SupabaseTable<ReactionImagesRow> {
  @override
  String get tableName => 'reaction images';

  @override
  ReactionImagesRow createRow(Map<String, dynamic> data) =>
      ReactionImagesRow(data);
}

class ReactionImagesRow extends SupabaseDataRow {
  ReactionImagesRow(super.data);

  @override
  SupabaseTable get table => ReactionImagesTable();

  int get rating => getField<int>('rating')!;
  set rating(int value) => setField<int>('rating', value);

  String? get imageLink => getField<String>('image_link');
  set imageLink(String? value) => setField<String>('image_link', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get emoji => getField<String>('emoji');
  set emoji(String? value) => setField<String>('emoji', value);
}
