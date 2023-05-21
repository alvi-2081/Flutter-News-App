import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart' as newsModel;
import 'package:news_app/views/widgets/news_details_app_bar.dart';
import 'package:news_app/views/widgets/news_details_body.dart';

class NewsDetailsPage extends StatelessWidget {
  final newsModel.Articles articles;
  const NewsDetailsPage({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                NewsDetailsAppBar(
                  index: 1,
                  imgUrl: articles.urlToImage.toString(),
                ),
                SliverToBoxAdapter(
                  child: NewsDetailsBody(
                    articles: articles,
                  ),
                ),
                // SliverPadding(
                //     padding: EdgeInsets.only(bottom: 1000)),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.25,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
