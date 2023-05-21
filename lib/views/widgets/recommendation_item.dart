import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart' as newsModel;
import 'package:intl/intl.dart';

class RecommendationItem extends StatelessWidget {
  final newsModel.Articles articles;
  const RecommendationItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat.jm()
        .format(DateTime.parse(articles.publishedAt.toString()).toLocal());
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              articles.urlToImage.toString(),
              height: 120,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articles.title.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${articles.author} • ${date}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
