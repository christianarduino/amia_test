import 'dart:convert';

import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';
import 'package:amia/shared/presentation/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorite_provider.g.dart';

@Riverpod(keepAlive: true)
class FavoriteNotifier extends _$FavoriteNotifier {
  late final SharedPreferences _prefs;
  final _favoriteDogKey = 'favorite_dog_key';

  @override
  List<BreedSubBreedModel> build() {
    _prefs = ref.read(sharedPrefsProvider)!;
    return _latestFavorites();
  }

  void addFavoriteBreed(BreedSubBreedModel newBreed) {
    final newFavorites = [...state, newBreed];
    state = newFavorites;
    _updateLocalFavorite(newFavorites);
  }

  void removeFavoriteBreed(BreedSubBreedModel breed) {
    final reducedFavorites =
        state.where((e) => e.breed != breed.breed).toList();
    state = reducedFavorites;
    _updateLocalFavorite(reducedFavorites);
  }

  void _updateLocalFavorite(List<BreedSubBreedModel> model) {
    _prefs.setString(_favoriteDogKey, jsonEncode(model));
  }

  List<BreedSubBreedModel> _latestFavorites() {
    final json = _prefs.getString(_favoriteDogKey);
    if(json == null) return [];

    final decodedJson = jsonDecode(json);
    return decodedJson.map<BreedSubBreedModel>((e) => BreedSubBreedModel.fromJson(e)).toList();
  }
}
