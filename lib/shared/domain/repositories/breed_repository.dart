import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';

abstract class BreedRepository {
  Future<List<BreedSubBreedModel>> fetchBreedsAndSubBreeds();
  Future<String> getRandomBreedImage(String breedName);
  Future<List<String>> getRandomDogImage([int? quantity]);
}
