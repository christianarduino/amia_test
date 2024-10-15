import 'package:amia/core/network/dio.dart';
import 'package:amia/shared/data/model/network_dog_response.dart';
import 'package:amia/shared/data/remote/breed_remote_data_source.dart';
import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'breed_remote_data_source_impl.g.dart';

class BreedRemoteDataSourceImpl extends BreedRemoteDataSource {
  final Dio _dio;

  BreedRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<BreedSubBreedModel>> fetchBreedAndSubBreed() async {
    try {
      final response = await _dio.get('/breeds/list/all');
      final model = NetworkDogResponse.fromJson(response.data);
      final bodyResponse = model.message as Map<String, dynamic>;

      final breeds = <BreedSubBreedModel>[];
      bodyResponse.forEach((breed, subBreed) {
        breeds.add(
          BreedSubBreedModel(
            breed: breed,
            subBreed: List<String>.from(subBreed),
          ),
        );
      });
      return breeds;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<String> getRandomBreedImage(String breedName) async {
    try {
      final response = await _dio.get('/breed/$breedName/images/random');
      final parsed = NetworkDogResponse.fromJson(response.data);

      return parsed.message as String;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<String>> getRandomDogImage([int? quantity = 1]) async {
    try {
      final response = await _dio.get('/breeds/image/random/$quantity');
      final parsed = NetworkDogResponse.fromJson(response.data);

      return List<String>.from(parsed.message);
    } catch (err) {
      rethrow;
    }
  }
}

@riverpod
BreedRemoteDataSource breedRemoteDataSource(BreedRemoteDataSourceRef ref) {
  return BreedRemoteDataSourceImpl(dio: ref.watch(dioProvider));
}
