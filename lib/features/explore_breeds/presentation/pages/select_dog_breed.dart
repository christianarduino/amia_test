import 'package:amia/features/explore_breeds/presentation/providers/select_breed_provider.dart';
import 'package:amia/shared/presentation/widgets/dog_breed_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SelectDogBreed extends ConsumerWidget {
  const SelectDogBreed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select dog breed'),
      ),
      body: DogBreedList(
        onBreedTap: (breed) {
          ref.read(selectBreedProvider.notifier).updateBreed(breed);
          ref.read(selectSubBreedProvider.notifier).clearSubBreed();
          context.pop();
        },
      ),
    );
  }
}
