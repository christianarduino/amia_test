import 'package:amia/shared/domain/model/breed_sub_breed_model.dart';
import 'package:amia/shared/presentation/providers/breed_provider.dart';
import 'package:amia/shared/presentation/providers/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteDogListTile extends ConsumerWidget {
  const FavoriteDogListTile({
    super.key,
    required this.breed,
  });

  final BreedSubBreedModel breed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteBreedNotifier = ref.watch(favoriteNotifierProvider.notifier);
    final imageAsync = ref.watch(randomBreedImageProvider(breed.breed));
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(breed.breed),
      leading: imageAsync.when(
        error: (_, __) {
          return const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
          );
        },
        loading: () {
          return const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
          );
        },
        data: (networkImage) {
          return CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(networkImage),
          );
        },
      ),
      trailing: IconButton(
        onPressed: () {
          favoriteBreedNotifier.removeFavoriteBreed(breed);
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
