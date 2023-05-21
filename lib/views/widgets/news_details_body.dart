import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart' as newsModel;

class NewsDetailsBody extends StatelessWidget {
  final newsModel.Articles articles;
  const NewsDetailsBody({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(articles.urlToImage.toString()),
              ),
              const SizedBox(width: 8.0),
              Text(
                articles.author.toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            articles.content.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
