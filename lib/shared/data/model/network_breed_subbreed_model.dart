import 'package:json_annotation/json_annotation.dart';

part 'network_breed_subbreed_model.g.dart';

@JsonSerializable()
class NetworkBreedSubbreedModel {
  NetworkBreedSubbreedModel(this.breedName, this.subBreed);

  final String breedName;
  final List<String> subBreed;

  factory NetworkBreedSubbreedModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkBreedSubbreedModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkBreedSubbreedModelToJson(this);
}
