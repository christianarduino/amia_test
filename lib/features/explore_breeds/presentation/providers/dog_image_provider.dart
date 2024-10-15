import 'package:amia/features/explore_breeds/data/repositories/explore_breeds_repository_impl.dart';
import 'package:amia/features/explore_breeds/domain/repositories/explore_breeds_repository.dart';
import 'package:amia/features/explore_breeds/presentation/model/dog_image_state.dart';
import 'package:amia/shared/data/repositories/breed_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dog_image_provider.g.dart';

@riverpod
class DogImageNotifier extends _$DogImageNotifier {
  late final ExploreBreedsRepository _repository;

  @override
  DogImageState build() {
    _repository = ref.read(exploreBreedsRepositoryProvider);
    return DogImageState();
  }

  void fetchBreedRandomImage(String breedName) {
    _callWithLoading(() async {
      final randomImage = await ref
          .read(breedRepositoryProvider)
          .getRandomBreedImage(breedName);
      state = state.copyWith(images: [randomImage]);
    });
  }

  void fetchBreedListImage(String breedName) {
    _callWithLoading(() async {
      final images = await _repository.getBreedListImage(breedName);
      state = state.copyWith(images: images);
    });
  }

  void fetchSubBreedListImage(String breedName, String subBreedName) {
    _callWithLoading(() async {
      final images =
          await _repository.getListSubBreedImage(breedName, subBreedName);
      state = state.copyWith(images: images);
    });
  }

  void fetchRandomSubBreedImage(String breedName, String subBreedName) {
    _callWithLoading(() async {
      final randomImage =
          await _repository.getRandomSubBreedImage(breedName, subBreedName);
      state = state.copyWith(images: [randomImage]);
    });
  }

  void fetchImageList(String breedName, String? subBreedName) {
    if (subBreedName == null) {
      fetchBreedListImage(breedName);
    } else {
      fetchSubBreedListImage(breedName, subBreedName);
    }
  }

  void fetchRandomImage(String breedName, String? subBreedName) {
    if (subBreedName == null) {
      fetchBreedRandomImage(breedName);
    } else {
      fetchRandomSubBreedImage(breedName, subBreedName);
    }
  }

  void _callWithLoading(Function() callback) {
    state = state.copyWith(isLoading: true, images: []);
    callback();
    state = state.copyWith(isLoading: false);
  }
}
