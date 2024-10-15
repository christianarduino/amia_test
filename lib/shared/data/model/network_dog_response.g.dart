// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_dog_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkDogResponse _$NetworkDogResponseFromJson(Map<String, dynamic> json) =>
    NetworkDogResponse(
      json['message'],
      json['status'] as String,
    );

Map<String, dynamic> _$NetworkDogResponseToJson(NetworkDogResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
