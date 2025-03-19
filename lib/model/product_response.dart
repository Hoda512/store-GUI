class ProductResponse {
  ProductResponse({
    this.id,
    this.title,
    this.slug,
    this.price,
    this.description,
    this.category,
    this.images,
    this.creationAt,
    this.updatedAt,
  });

  ProductResponse.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? title;
  String? slug;
  num? price;
  String? description;
  Category? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  ProductResponse copyWith({
    num? id,
    String? title,
    String? slug,
    num? price,
    String? description,
    Category? category,
    List<String>? images,
    String? creationAt,
    String? updatedAt,
  }) =>
      ProductResponse(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        images: images ?? this.images,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['price'] = price;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['images'] = images;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  num? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;
  Category copyWith({
    num? id,
    String? name,
    String? slug,
    String? image,
    String? creationAt,
    String? updatedAt,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        slug: slug ?? this.slug,
        image: image ?? this.image,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}
