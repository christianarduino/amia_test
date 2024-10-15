abstract class ExploreBreedsRemoteDataSource {
  Future<List<String>> getBreedListImage(String breedName);
  Future<String> getRandomSubBreedImage(String breedName, String subBreed);
  Future<List<String>> getListSubBreedImage(String breedName, String subBreed);
}
