// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchBreedHash() => r'2d57f1fd5900ae9e5941c66dd4da4a5889e3113a';

/// See also [fetchBreed].
@ProviderFor(fetchBreed)
final fetchBreedProvider =
    AutoDisposeFutureProvider<List<BreedSubBreedModel>>.internal(
  fetchBreed,
  name: r'fetchBreedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchBreedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchBreedRef = AutoDisposeFutureProviderRef<List<BreedSubBreedModel>>;
String _$randomBreedImageHash() => r'ce92fa3571103383adff1016a1b6232d6c499dc7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [randomBreedImage].
@ProviderFor(randomBreedImage)
const randomBreedImageProvider = RandomBreedImageFamily();

/// See also [randomBreedImage].
class RandomBreedImageFamily extends Family<AsyncValue<String>> {
  /// See also [randomBreedImage].
  const RandomBreedImageFamily();

  /// See also [randomBreedImage].
  RandomBreedImageProvider call(
    String breed,
  ) {
    return RandomBreedImageProvider(
      breed,
    );
  }

  @override
  RandomBreedImageProvider getProviderOverride(
    covariant RandomBreedImageProvider provider,
  ) {
    return call(
      provider.breed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'randomBreedImageProvider';
}

/// See also [randomBreedImage].
class RandomBreedImageProvider extends AutoDisposeFutureProvider<String> {
  /// See also [randomBreedImage].
  RandomBreedImageProvider(
    String breed,
  ) : this._internal(
          (ref) => randomBreedImage(
            ref as RandomBreedImageRef,
            breed,
          ),
          from: randomBreedImageProvider,
          name: r'randomBreedImageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomBreedImageHash,
          dependencies: RandomBreedImageFamily._dependencies,
          allTransitiveDependencies:
              RandomBreedImageFamily._allTransitiveDependencies,
          breed: breed,
        );

  RandomBreedImageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.breed,
  }) : super.internal();

  final String breed;

  @override
  Override overrideWith(
    FutureOr<String> Function(RandomBreedImageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RandomBreedImageProvider._internal(
        (ref) => create(ref as RandomBreedImageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        breed: breed,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _RandomBreedImageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomBreedImageProvider && other.breed == breed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, breed.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RandomBreedImageRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `breed` of this provider.
  String get breed;
}

class _RandomBreedImageProviderElement
    extends AutoDisposeFutureProviderElement<String> with RandomBreedImageRef {
  _RandomBreedImageProviderElement(super.provider);

  @override
  String get breed => (origin as RandomBreedImageProvider).breed;
}

String _$randomDogImagesHash() => r'597a37feece1b914608dc21ed376d29d1b0de9a1';

/// See also [randomDogImages].
@ProviderFor(randomDogImages)
const randomDogImagesProvider = RandomDogImagesFamily();

/// See also [randomDogImages].
class RandomDogImagesFamily extends Family<AsyncValue<List<String>>> {
  /// See also [randomDogImages].
  const RandomDogImagesFamily();

  /// See also [randomDogImages].
  RandomDogImagesProvider call([
    int? quantity,
  ]) {
    return RandomDogImagesProvider(
      quantity,
    );
  }

  @override
  RandomDogImagesProvider getProviderOverride(
    covariant RandomDogImagesProvider provider,
  ) {
    return call(
      provider.quantity,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'randomDogImagesProvider';
}

/// See also [randomDogImages].
class RandomDogImagesProvider extends AutoDisposeFutureProvider<List<String>> {
  /// See also [randomDogImages].
  RandomDogImagesProvider([
    int? quantity,
  ]) : this._internal(
          (ref) => randomDogImages(
            ref as RandomDogImagesRef,
            quantity,
          ),
          from: randomDogImagesProvider,
          name: r'randomDogImagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomDogImagesHash,
          dependencies: RandomDogImagesFamily._dependencies,
          allTransitiveDependencies:
              RandomDogImagesFamily._allTransitiveDependencies,
          quantity: quantity,
        );

  RandomDogImagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quantity,
  }) : super.internal();

  final int? quantity;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(RandomDogImagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RandomDogImagesProvider._internal(
        (ref) => create(ref as RandomDogImagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quantity: quantity,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _RandomDogImagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomDogImagesProvider && other.quantity == quantity;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RandomDogImagesRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `quantity` of this provider.
  int? get quantity;
}

class _RandomDogImagesProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with RandomDogImagesRef {
  _RandomDogImagesProviderElement(super.provider);

  @override
  int? get quantity => (origin as RandomDogImagesProvider).quantity;
}

String _$searchNotifierHash() => r'6415a8308da3a2b5d36bf5af0f622e39e5c8be7b';

/// See also [SearchNotifier].
@ProviderFor(SearchNotifier)
final searchNotifierProvider = AutoDisposeNotifierProvider<SearchNotifier,
    List<BreedSubBreedModel>>.internal(
  SearchNotifier.new,
  name: r'searchNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchNotifier = AutoDisposeNotifier<List<BreedSubBreedModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
