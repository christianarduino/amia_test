// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BreedSubBreedModel {
  final String breed;
  final List<String> subBreed;

  BreedSubBreedModel({required this.breed, required this.subBreed});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'breed': breed,
      'subBreed': subBreed,
    };
  }

  factory BreedSubBreedModel.fromMap(Map<String, dynamic> map) {
    return BreedSubBreedModel(
      breed: map['breed'] as String,
      subBreed: List<String>.from(map['subBreed']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BreedSubBreedModel.fromJson(String source) =>
      BreedSubBreedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant BreedSubBreedModel other) {
    if (identical(this, other)) return true;

    return other.breed == breed && listEquals(other.subBreed, subBreed);
  }

  @override
  int get hashCode => breed.hashCode ^ subBreed.hashCode;
}
