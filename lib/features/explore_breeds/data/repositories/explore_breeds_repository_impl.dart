import 'package:amia/features/explore_breeds/data/remote/explore_breeds_remote_data_source.dart';
import 'package:amia/features/explore_breeds/data/remote/explore_breeds_remote_data_source_impl.dart';
import 'package:amia/features/explore_breeds/domain/repositories/explore_breeds_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'explore_breeds_repository_impl.g.dart';

class ExploreBreedsRepositoryImpl extends ExploreBreedsRepository {
  final ExploreBreedsRemoteDataSource _remoteDataSource;

  ExploreBreedsRepositoryImpl(
      {required ExploreBreedsRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<List<String>> getBreedListImage(String breedName) {
    return _remoteDataSource.getBreedListImage(breedName);
  }

  @override
  Future<List<String>> getListSubBreedImage(String breedName, String subBreed) {
    return _remoteDataSource.getListSubBreedImage(breedName, subBreed);
  }

  @override
  Future<String> getRandomSubBreedImage(String breedName, String subBreed) {
    return _remoteDataSource.getRandomSubBreedImage(breedName, subBreed);
  }
}

@riverpod
ExploreBreedsRepository exploreBreedsRepository(
    ExploreBreedsRepositoryRef ref) {
  return ExploreBreedsRepositoryImpl(
    remoteDataSource: ref.read(exploreBreedsRemoteDataSourceProvider),
  );
}
