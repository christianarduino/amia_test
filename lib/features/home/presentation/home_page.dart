import 'package:amia/features/home/presentation/widgets/action_title.dart';
import 'package:amia/features/home/presentation/widgets/favorite_breed_list.dart';
import 'package:amia/shared/presentation/providers/breed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final breedAsync = ref.watch(fetchBreedProvider);
    final randomDogImagesAsync = ref.watch(RandomDogImagesProvider(5));
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome dog lovers',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Icon(Icons.pets),
              ],
            ),
            const SizedBox(height: 32),
            breedAsync.when(
              error: (_, __) => Column(
                children: [
                  Text(
                    'We are sorry for the inconvenience!',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  ElevatedButton(
                    onPressed: () => ref.refresh(fetchBreedProvider),
                    child: const Text('Try again'),
                  ),
                ],
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              data: (_) {
                return Column(
                  children: [
                    ActionTitle(
                      title: 'Explore dog breeds',
                      buttonLabel: 'See more',
                      onPressed: () => context.pushNamed('breeds'),
                    ),
                    const SizedBox(height: 16),
                    randomDogImagesAsync.when(
                      error: (_, __) => const SizedBox.shrink(),
                      loading: () => const SizedBox.shrink(),
                      data: (images) {
                        return SizedBox(
                          height: 200,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 16),
                            itemBuilder: (_, int i) {
                              final image = images[i];
                              return SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    ActionTitle(
                      title: 'Your favorite breeds',
                      buttonLabel: 'Add new',
                      onPressed: () => context.pushNamed('favorites'),
                    ),
                    const SizedBox(height: 16),
                    const FavoriteBreedList(),
                    const SizedBox(height: 32),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
