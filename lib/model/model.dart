import 'package:dio/dio.dart';

class ProductResponse {
  int? id;
  String? title;
  String? slug;
  int? price;
  List<String>? images;
  String? description;
  ProductResponse(this.price, this.id, this.slug, this.images, this.title,
      this.description);
  ProductResponse.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    images = json["images"];
    price = json["price"];
  }
}
