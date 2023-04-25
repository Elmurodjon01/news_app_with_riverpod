import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_with_riverpod/src/news/domain/news_model.dart';
import 'package:news_app_with_riverpod/src/news/presentation/detail_page.dart';
import 'package:news_app_with_riverpod/src/news/presentation/mainPage.dart';

enum AppRoute {
  home,
  readLater,
  detail,
}

GoRouter goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const MainPage(),
      routes: [
        // GoRoute(
        //   path: 'detail',
        //   name: AppRoute.detail.name,
        //   pageBuilder: (context, state) {
        //     final author = state.params['author'];
        //     final title = state.params['title'];
        //     final description = state.params['description'];
        //     final url = state.params['url'];
        //     final urlToImage = state.params['urlToImage'];
        //     final publishedAt = state.params['publishedAt'];
        //     final content = state.params['content'];

        //     return MaterialPage(
        //       key: state.pageKey,
        //       fullscreenDialog: true,
        //       child: DetailPage(
        //         title,
        //         author,
        //         description,
        //         url,
        //         urlToImage,
        //         publishedAt,
        //         content,
        //       ),
        //     );
        //   },
        // ),
      ],
    )
  ],
);
