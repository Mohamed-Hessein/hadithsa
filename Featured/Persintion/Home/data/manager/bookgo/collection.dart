class Collection {
  String? name;
  String? book;
  String? author;
  String? language;
  bool? hasSections;
  String? direction;
  String? source;
  String? comments;
  String? link;
  String? linkmin;

  Collection({
    this.name,
    this.book,
    this.author,
    this.language,
    this.hasSections,
    this.direction,
    this.source,
    this.comments,
    this.link,
    this.linkmin,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    name: json['name'] as String?,
    book: json['book'] as String?,
    author: json['author'] as String?,
    language: json['language'] as String?,
    hasSections: json['has_sections'] as bool?,
    direction: json['direction'] as String?,
    source: json['source'] as String?,
    comments: json['comments'] as String?,
    link: json['link'] as String?,
    linkmin: json['linkmin'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'book': book,
    'author': author,
    'language': language,
    'has_sections': hasSections,
    'direction': direction,
    'source': source,
    'comments': comments,
    'link': link,
    'linkmin': linkmin,
  };
}
