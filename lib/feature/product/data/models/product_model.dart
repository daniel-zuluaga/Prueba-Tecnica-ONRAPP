import 'dart:convert';

import 'package:prueba_tecnica_orn/feature/product/domain/entities/product_entity.dart';

List<ProductModel> productModelFromMap(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromMap(x)));

String productModelToMap(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ProductModel extends ProductEntity {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
          rating: rating,
        );

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: double.parse(json["price"]?.toString() ?? '0'),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: RatingModel.fromMap(json["rating"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating.toMap(),
      };
}

class RatingModel extends RatingEntity {
  final double rate;
  final int count;

  RatingModel({
    required this.rate,
    required this.count,
  }) : super(
          rate: rate,
          count: count,
        );

  factory RatingModel.fromMap(Map<String, dynamic> json) => RatingModel(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "rate": rate,
        "count": count,
      };
}
