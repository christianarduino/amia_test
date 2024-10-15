// ignore_for_file: public_member_api_docs, sort_constructors_first
class DogImageState {
  final bool isLoading;
  final List<String> images;

  DogImageState({
    this.isLoading = false,
    this.images = const [],
  });

  DogImageState copyWith({
    bool? isLoading,
    List<String>? images,
  }) {
    return DogImageState(
      isLoading: isLoading ?? this.isLoading,
      images: images ?? this.images,
    );
  }
}
