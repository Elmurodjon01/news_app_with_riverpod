import 'package:go_router/go_router.dart';
import 'package:news_app_with_riverpod/src/news/presentation/mainPage.dart';

enum AppRoute {
  home,
  readLater,
}

GoRouter goRouter =
    GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
  GoRoute(
    path: '/',
    name: AppRoute.home.name,
    builder: (context, state) => const MainPage(),
  )
]);
