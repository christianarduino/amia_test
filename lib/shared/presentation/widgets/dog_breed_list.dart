import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';
import 'package:amia/shared/presentation/providers/breed_provider.dart';
import 'package:amia/shared/presentation/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogBreedList extends ConsumerStatefulWidget {
  const DogBreedList({
    super.key,
    this.includeFavoriteOption = true,
    this.onBreedTap,
  });

  final bool includeFavoriteOption;
  final Function(BreedSubBreedModel)? onBreedTap;

  @override
  ConsumerState<DogBreedList> createState() => _DogBreedListState();
}

class _DogBreedListState extends ConsumerState<DogBreedList> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteNotifierProvider);
    final favoriteNotifier = ref.watch(favoriteNotifierProvider.notifier);
    final filteredBreed = ref.watch(searchNotifierProvider);
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: TextFormField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search breed...',
            ),
            onChanged: searchNotifier.onSearchChanged,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemCount: filteredBreed.length,
            itemBuilder: (_, int i) {
              final breed = filteredBreed[i];
              final isFavorite = favorites.contains(breed);
              return ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () => widget.onBreedTap?.call(breed),
                title: Text(breed.breed),
                subtitle: Text('${breed.subBreed.length} sub breeds'),
                trailing: widget.includeFavoriteOption
                    ? IconButton(
                        onPressed: () {
                          if (isFavorite) {
                            favoriteNotifier.removeFavoriteBreed(breed);
                          } else {
                            favoriteNotifier.addFavoriteBreed(breed);
                          }
                        },
                        icon: isFavorite
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_outline),
                      )
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }
}
