import 'package:amia/features/explore_breeds/presentation/providers/dog_image_provider.dart';
import 'package:amia/features/explore_breeds/presentation/providers/select_breed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExploreBreedsPage extends ConsumerWidget {
  const ExploreBreedsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBreed = ref.watch(selectBreedProvider);
    final selectedSubBreed = ref.watch(selectSubBreedProvider);
    final dogImageNotifier = ref.read(dogImageNotifierProvider.notifier);
    final dogImageState = ref.watch(dogImageNotifierProvider);
    bool disableSubBreed =
        selectedBreed == null || selectedBreed.subBreed.isEmpty;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore dog breeds'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  context.pushNamed('select-breed');
                },
                title: Text(selectedBreed?.breed ?? 'Select dog breed'),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: !disableSubBreed
                    ? () {
                        context.pushNamed(
                          'select-sub-breed',
                          extra: selectedBreed.subBreed,
                        );
                      }
                    : null,
                title: Text(
                  selectedSubBreed ?? 'Select dog sub breed',
                  style: TextStyle(
                    color: disableSubBreed
                        ? Theme.of(context).disabledColor
                        : null,
                  ),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color:
                      disableSubBreed ? Theme.of(context).disabledColor : null,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedBreed == null
                          ? null
                          : () {
                              dogImageNotifier.fetchRandomImage(
                                selectedBreed.breed,
                                selectedSubBreed,
                              );
                            },
                      child: const Text('Get random image'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedBreed == null
                          ? null
                          : () {
                              dogImageNotifier.fetchImageList(
                                selectedBreed.breed,
                                selectedSubBreed,
                              );
                            },
                      child: const Text('Get image list'),
                    ),
                  ),
                ],
              ),
              if (dogImageState.isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (dogImageState.images.length == 1)
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 300,
                    child: Image.network(
                      dogImageState.images.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: dogImageState.images.length,
                    itemBuilder: (_, int i) {
                      final image = dogImageState.images[i];
                      return Image.network(
                        image,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
