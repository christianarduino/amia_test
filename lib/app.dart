import 'package:amia/core/app_router.dart';
import 'package:amia/shared/presentation/providers/breed_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AmiaTest extends ConsumerWidget {
  const AmiaTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(fetchBreedProvider);

    return MaterialApp.router(
      title: 'Dog Breeds App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
