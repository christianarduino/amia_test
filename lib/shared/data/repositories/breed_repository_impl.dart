import 'package:amia/shared/data/remote/breed_remote_data_source.dart';
import 'package:amia/shared/data/remote/breed_remote_data_source_impl.dart';
import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';
import 'package:amia/shared/domain/repositories/breed_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'breed_repository_impl.g.dart';

class BreedRepositoryImpl extends BreedRepository {
  final BreedRemoteDataSource _remoteDataSource;

  BreedRepositoryImpl({required BreedRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<List<BreedSubBreedModel>> fetchBreedsAndSubBreeds() {
    return _remoteDataSource.fetchBreedAndSubBreed();
  }

  @override
  Future<String> getRandomBreedImage(String breedName) {
    return _remoteDataSource.getRandomBreedImage(breedName);
  }

  @override
  Future<List<String>> getRandomDogImage([int? quantity]) {
    return _remoteDataSource.getRandomDogImage(quantity);
  }
}

@riverpod
BreedRepository breedRepository(BreedRepositoryRef ref) {
  final remoteDataSource = ref.read(breedRemoteDataSourceProvider);
  return BreedRepositoryImpl(remoteDataSource: remoteDataSource);
}
