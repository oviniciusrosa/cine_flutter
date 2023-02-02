// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cine_flutter/modules/movies/domain/enums/category.dart';

class Movie {
  final String title;
  final String thumbUrl;
  final String about;
  final List<Category> categories;
  final int votesNumber;
  final double rate;

  Movie({
    required this.title,
    required this.thumbUrl,
    required this.about,
    required this.categories,
    this.votesNumber = 0,
    this.rate = 0,
  });

  Movie copyWith({
    String? title,
    String? thumbUrl,
    String? about,
    List<Category>? categories,
    int? votesNumber,
    double? rate,
  }) {
    return Movie(
      title: title ?? this.title,
      thumbUrl: thumbUrl ?? this.thumbUrl,
      about: about ?? this.about,
      categories: categories ?? this.categories,
      votesNumber: votesNumber ?? this.votesNumber,
      rate: rate ?? this.rate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'thumbUrl': thumbUrl,
      'about': about,
      'categories': categories.map((x) => x.toMap()).toList(),
      'votesNumber': votesNumber,
      'rate': rate,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] as String,
      thumbUrl: map['thumbUrl'] as String,
      about: map['about'] as String,
      categories: List<Category>.from(
        (map['categories'] as List<dynamic>).map<Category>(
          (x) => Category.fromMap(x as String),
        ),
      ),
      votesNumber: map['votesNumber'] as int,
      rate: map['rate'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Movie(title: $title, thumbUrl: $thumbUrl, about: $about, categories: $categories, votesNumber: $votesNumber, rate: $rate)';
  }
}
