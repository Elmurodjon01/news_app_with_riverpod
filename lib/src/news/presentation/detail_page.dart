import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app_with_riverpod/src/news/constants/const.dart';
import 'package:news_app_with_riverpod/src/news/domain/news_model.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  final author;

  final title;
  final description;
  final url;
  final urlToImage;
  final publishedAt;
  final content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 450.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      urlToImage ?? imagePlaceHolder,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      AutoSizeText(
                        title.toString(),
                        minFontSize: 25,
                        maxFontSize: 40,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 70.0,
                      ),
                      AutoSizeText(
                        description.toString(),
                        minFontSize: 13,
                        maxFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Chip(
                            backgroundColor: Colors.black,
                            label: Text(
                              author.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Chip(
                            backgroundColor:
                                const Color.fromARGB(77, 184, 181, 181),
                            label: Text(
                              publishedAt.toString(),
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AutoSizeText(
                        title.toString(),
                        minFontSize: 15,
                        maxLines: 4,
                        maxFontSize: 25,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AutoSizeText(
                        content.toString(),
                        minFontSize: 12,
                        maxLines: 300,
                        maxFontSize: 15,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      AutoSizeText(
                        description.toString(),
                        minFontSize: 12,
                        maxLines: 30,
                        maxFontSize: 15,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AutoSizeText(
                        'Want to see more: ${url.toString()}',
                        minFontSize: 12,
                        maxLines: 30,
                        maxFontSize: 15,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
