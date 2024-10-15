// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_breed_subbreed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkBreedSubbreedModel _$NetworkBreedSubbreedModelFromJson(
        Map<String, dynamic> json) =>
    NetworkBreedSubbreedModel(
      json['breedName'] as String,
      (json['subBreed'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$NetworkBreedSubbreedModelToJson(
        NetworkBreedSubbreedModel instance) =>
    <String, dynamic>{
      'breedName': instance.breedName,
      'subBreed': instance.subBreed,
    };
