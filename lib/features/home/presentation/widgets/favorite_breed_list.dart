import 'package:amia/features/home/presentation/widgets/favorite_dog_list_tile.dart';
import 'package:amia/shared/presentation/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteBreedList extends ConsumerWidget {
  const FavoriteBreedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteBreed = ref.watch(favoriteNotifierProvider);

    if (favoriteBreed.isEmpty) {
      return const Center(
        child: Text('No favorite breeds yet'),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemCount: favoriteBreed.length,
      itemBuilder: (_, int i) {
        final breed = favoriteBreed[i];
        return FavoriteDogListTile(breed: breed);
      },
    );
  }
}
