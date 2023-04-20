import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_with_riverpod/src/news/domain/news_model.dart';
import 'package:news_app_with_riverpod/src/providers/news_provider.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NewsModel data = ref.watch(dataProvider).newsModel;
    var isLoading = ref.watch(dataProvider).isLoading;
    // isLoading = true;
    return isLoading
        ? const CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              title: const Text('newws'),
              leading: TextButton(
                  onPressed: () {
                    print(data.articles!.length);
                  },
                  child: Text('press')),
            ),
            body: ListView.builder(
                itemCount: data.articles!.length,
                itemBuilder: (context, i) {
                  print(data.articles!.length);
                  return ListTile(
                    title: Text(data.articles![i].title.toString()),
                  );
                }),
          );
  }
}
