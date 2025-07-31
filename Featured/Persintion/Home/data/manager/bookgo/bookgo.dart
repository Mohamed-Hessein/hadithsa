import 'collection.dart';

class Bookgo {
  String? name;
  List<Collection>? collection;

  Bookgo({this.name, this.collection});

  factory Bookgo.fromJson(Map<String, dynamic> json) => Bookgo(
    name: json['name'] as String?,
    collection: (json['collection'] is List)
        ? (json['collection'] as List)
              .map((e) => Collection.fromJson(e as Map<String, dynamic>))
              .toList()
        : null,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'collection': collection?.map((e) => e.toJson()).toList(),
  };
}
