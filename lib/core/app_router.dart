import 'package:amia/features/explore_breeds/favorites_dog/presentation/pages/favorites_dog_page.dart';
import 'package:amia/features/home/presentation/home_page.dart';
import 'package:amia/features/explore_breeds/presentation/pages/explore_breeds_page.dart';
import 'package:amia/features/explore_breeds/presentation/pages/select_dog_breed.dart';
import 'package:amia/features/explore_breeds/presentation/pages/select_sub_breed_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'breeds',
      path: '/breeds',
      builder: (context, state) => const ExploreBreedsPage(),
      routes: [
        GoRoute(
          name: 'select-breed',
          path: 'select_breed',
          builder: (context, state) => const SelectDogBreed(),
        ),
        GoRoute(
          name: 'select-sub-breed',
          path: 'select_sub_breed',
          builder: (context, state) {
            final extra = state.extra as List<String>;
            return SelectSubBreedPage(subBreed: extra);
          },
        ),
      ],
    ),
    GoRoute(
      name: 'favorites',
      path: '/favorites',
      builder: (context, state) => const FavoritesDogPage(),
    ),
  ],
);
