import 'package:amia/features/explore_breeds/presentation/providers/select_breed_provider.dart';
import 'package:amia/shared/presentation/providers/breed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RandomBreedPage extends ConsumerWidget {
  const RandomBreedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBreed = ref.watch(selectBreedProvider);
    final selectedSubBreed = ref.watch(selectSubBreedProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore dog breeds'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {
                final breeds = ref.read(fetchBreedProvider);
                if (breeds.hasValue) {
                  context.pushNamed('select-breed', extra: breeds.value);
                }
              },
              title: Text(selectedBreed?.breed ?? 'Select dog breed'),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            ListTile(
              onTap:
                  (selectedBreed != null && selectedBreed.subBreed.isNotEmpty)
                      ? () {
                          context.pushNamed(
                            'select-sub-breed',
                            extra: selectedBreed.subBreed,
                          );
                        }
                      : null,
              title: Text(selectedSubBreed ?? 'Select dog sub breed'),
              trailing: const Icon(Icons.keyboard_arrow_right),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Get random image'),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Get image list'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
