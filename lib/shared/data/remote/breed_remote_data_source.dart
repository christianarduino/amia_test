import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';

abstract class BreedRemoteDataSource {
  Future<List<BreedSubBreedModel>> fetchBreedAndSubBreed();
  Future<String> getRandomBreedImage(String breedName);
  Future<List<String>> getRandomDogImage([int? quantity]);
}
