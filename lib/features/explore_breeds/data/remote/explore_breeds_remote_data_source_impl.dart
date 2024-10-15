import 'package:amia/core/network/dio.dart';
import 'package:amia/features/explore_breeds/data/remote/explore_breeds_remote_data_source.dart';
import 'package:amia/shared/data/model/network_dog_response.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'explore_breeds_remote_data_source_impl.g.dart';

class ExploreBreedsRemoteDataSourceImpl extends ExploreBreedsRemoteDataSource {
  final Dio _dio;

  ExploreBreedsRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<String>> getBreedListImage(String breedName) async {
    try {
      final response = await _dio.get('/breed/$breedName/images');
      final parsed = NetworkDogResponse.fromJson(response.data);

      return List<String>.from(parsed.message);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<List<String>> getListSubBreedImage(
      String breedName, String subBreed) async {
    try {
      final response = await _dio.get('/breed/$breedName/$subBreed/images');
      final parsed = NetworkDogResponse.fromJson(response.data);

      return List.from(parsed.message);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<String> getRandomSubBreedImage(
      String breedName, String subBreed) async {
    try {
      final response =
          await _dio.get('/breed/$breedName/$subBreed/images/random');
      final parsed = NetworkDogResponse.fromJson(response.data);

      return parsed.message as String;
    } catch (err) {
      rethrow;
    }
  }
}

@riverpod
ExploreBreedsRemoteDataSource exploreBreedsRemoteDataSource(
    ExploreBreedsRemoteDataSourceRef ref) {
  return ExploreBreedsRemoteDataSourceImpl(
    dio: ref.read(dioProvider),
  );
}
