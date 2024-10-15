import 'package:json_annotation/json_annotation.dart';

part 'network_dog_response.g.dart';

@JsonSerializable()
class NetworkDogResponse {
  NetworkDogResponse(this.message, this.status);

  final dynamic message;
  final String status;

  factory NetworkDogResponse.fromJson(Map<String, dynamic> json) =>
      _$NetworkDogResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkDogResponseToJson(this);
}
