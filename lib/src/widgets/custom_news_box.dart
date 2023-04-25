import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_riverpod/src/news/constants/const.dart';
import 'package:news_app_with_riverpod/src/news/domain/news_model.dart';
import 'package:news_app_with_riverpod/src/news/presentation/detail_page.dart';

class CustomNewsBox extends StatelessWidget {
  const CustomNewsBox({
    super.key,
    required this.news,
  });
  final Article news;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              author: news.author,
              content: news.content,
              description: news.description,
              publishedAt: news.publishedAt,
              title: news.title,
              url: news.url,
              urlToImage: news.urlToImage,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height * 0.1,
        width: width * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 130,
              width: 120,
              // child: Image.network(imagePlaceHolder),
              child: CachedNetworkImage(
                placeholder: (context, url) => Image.network(
                  imagePlaceHolder,
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
                imageUrl: news.urlToImage == null
                    ? imagePlaceHolder
                    : news.urlToImage.toString(),
                errorWidget: (context, url, error) {
                  return Image.network(
                    imagePlaceHolder,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AutoSizeText(
                      news.title.toString(),
                      style: const TextStyle(fontSize: 12),
                      minFontSize: 10,
                      maxLines: 5,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'Author: ${news.author.toString()}',
                          style: const TextStyle(fontSize: 10),
                          minFontSize: 8,
                          maxLines: 5,
                          overflow: TextOverflow.visible,
                        ),
                        AutoSizeText(
                          'Published: ${news.publishedAt.toString()}',
                          style: const TextStyle(fontSize: 10),
                          minFontSize: 8,
                          maxLines: 5,
                          overflow: TextOverflow.visible,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
