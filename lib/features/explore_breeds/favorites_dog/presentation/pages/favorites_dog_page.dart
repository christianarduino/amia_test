import 'package:amia/shared/presentation/widgets/dog_breed_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesDogPage extends ConsumerWidget {
  const FavoritesDogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new favorite'),
      ),
      body: const DogBreedList(),
    );
  }
}
