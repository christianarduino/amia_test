import 'dart:async';

import 'package:amia/shared/data/repositories/breed_repository_impl.dart';
import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'breed_provider.g.dart';

@riverpod
Future<List<BreedSubBreedModel>> fetchBreed(FetchBreedRef ref) {
  return ref.read(breedRepositoryProvider).fetchBreedsAndSubBreeds();
}

@riverpod
Future<String> randomBreedImage(RandomBreedImageRef ref, String breed) {
  return ref.read(breedRepositoryProvider).getRandomBreedImage(breed);
}

@riverpod
Future<List<String>> randomDogImages(RandomDogImagesRef ref, [int? quantity]) {
  return ref.read(breedRepositoryProvider).getRandomDogImage(quantity);
}

@riverpod
class SearchNotifier extends _$SearchNotifier {
  Timer? _debounce;
  late List<BreedSubBreedModel> allBreeds;

  @override
  List<BreedSubBreedModel> build() {
    _dispose();
    allBreeds = ref.read(fetchBreedProvider).value ?? [];
    return allBreeds;
  }

  void onSearchChanged(String query) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      _filterBreeds(query);
    });
  }

  void _filterBreeds(String query) {
    if (query.isEmpty) {
      state = allBreeds;
    } else {
      final filteredBreeds = allBreeds
          .where((breed) =>
              breed.breed.toLowerCase().contains(query.toLowerCase()))
          .toList();
      state = filteredBreeds;
    }
  }

  void _dispose() {
    ref.onDispose(() async {
      _debounce?.cancel();
    });
  }
}
