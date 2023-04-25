import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app_with_riverpod/src/news/data/api_service.dart';

import '../news/domain/news_model.dart';

part 'news_provider.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default(true) bool isLoading,
    required NewsModel newsModel,
  }) = _NewsState;

  const NewsState._();
}

class DataNotifier extends StateNotifier<NewsState> {
  DataNotifier() : super(NewsState(newsModel: NewsModel(articles: []))) {
    getNews();
  }

  getNews() async {
    state = state.copyWith(isLoading: true);
    final newsRes = await NewsService().fetchData();
    final news = NewsModel.fromJson(newsRes);
    state = state.copyWith(isLoading: false, newsModel: news);

    getNewsBySearch(String title) async {
      state = state.copyWith(isLoading: true);
      final searchRes = await NewsService().fetchNewsBySearching(title);
      final searchData = NewsModel.fromJson(searchRes);
      state = state.copyWith(isLoading: false);
    }
  }
}

final dataProvider =
    StateNotifierProvider<DataNotifier, NewsState>((ref) => DataNotifier());
