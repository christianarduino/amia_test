import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_breed_provider.g.dart';

@riverpod
class SelectBreed extends _$SelectBreed {
  @override
  BreedSubBreedModel? build() => null;

  void updateBreed(BreedSubBreedModel? newBreed) => state = newBreed;
}

@riverpod
class SelectSubBreed extends _$SelectSubBreed {
  @override
  String? build() => null;

  void updateSubBreed(String? newSubBreed) => state = newSubBreed;
  void clearSubBreed() => state = null;
}
