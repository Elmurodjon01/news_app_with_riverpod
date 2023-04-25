import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_with_riverpod/src/news/domain/news_model.dart';
import 'package:news_app_with_riverpod/src/providers/news_provider.dart';
import 'package:news_app_with_riverpod/src/routing/routing.dart';
import 'package:news_app_with_riverpod/src/widgets/custom_news_box.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsModel data = ref.watch(dataProvider).newsModel;
    var isLoading = ref.watch(dataProvider).isLoading;
    // isLoading = true;
    return isLoading
        ? const Center(
            child: SizedBox(
                height: 100, width: 100, child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('news'),
            ),
            body: ListView.builder(
              itemCount: data.articles!.length,
              itemBuilder: (context, i) {
                return CustomNewsBox(
                  news: data.articles![i],
                );
              },
            ),
          );
  }
}


// context.goNamed(
//                     AppRoute.detail.name,
//                     params: {
//                       'title': data.articles![i].title!,
//                       'author': data.articles![i].author!,
//                       'description': data.articles![i].description!,
//                       'url': data.articles![i].url!,
//                       'urlToImage': data.articles![i].urlToImage!,
//                       'publishedAt': data.articles![i].publishedAt!,
//                       'content': data.articles![i].content!,
//                     },
//                   );