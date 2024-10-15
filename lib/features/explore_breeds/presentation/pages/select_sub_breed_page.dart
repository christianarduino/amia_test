import 'package:amia/features/explore_breeds/presentation/providers/select_breed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SelectSubBreedPage extends ConsumerWidget {
  final List<String> subBreed;

  const SelectSubBreedPage({super.key, required this.subBreed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select dog sub breed'),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: subBreed.length,
        itemBuilder: (_, int i) {
          final breed = subBreed[i];
          return ListTile(
            onTap: () {
              ref.read(selectSubBreedProvider.notifier).updateSubBreed(breed);
              context.pop();
            },
            title: Text(breed),
          );
        },
      ),
    );
  }
}
