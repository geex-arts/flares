// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiWishStruct extends BaseStruct {
  AiWishStruct({
    String? name,
    String? category,
    String? budget,
    String? description,
    String? city,
    String? address,
    String? link,
  })  : _name = name,
        _category = category,
        _budget = budget,
        _description = description,
        _city = city,
        _address = address,
        _link = link;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "budget" field.
  String? _budget;
  String get budget => _budget ?? '';
  set budget(String? val) => _budget = val;
  bool hasBudget() => _budget != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static AiWishStruct fromMap(Map<String, dynamic> data) => AiWishStruct(
        name: data['name'] as String?,
        category: data['category'] as String?,
        budget: data['budget'] as String?,
        description: data['description'] as String?,
        city: data['city'] as String?,
        address: data['address'] as String?,
        link: data['link'] as String?,
      );

  static AiWishStruct? maybeFromMap(dynamic data) =>
      data is Map ? AiWishStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'category': _category,
        'budget': _budget,
        'description': _description,
        'city': _city,
        'address': _address,
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'budget': serializeParam(
          _budget,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static AiWishStruct fromSerializableMap(Map<String, dynamic> data) =>
      AiWishStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        budget: deserializeParam(
          data['budget'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AiWishStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AiWishStruct &&
        name == other.name &&
        category == other.category &&
        budget == other.budget &&
        description == other.description &&
        city == other.city &&
        address == other.address &&
        link == other.link;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, category, budget, description, city, address, link]);
}

AiWishStruct createAiWishStruct({
  String? name,
  String? category,
  String? budget,
  String? description,
  String? city,
  String? address,
  String? link,
}) =>
    AiWishStruct(
      name: name,
      category: category,
      budget: budget,
      description: description,
      city: city,
      address: address,
      link: link,
    );
