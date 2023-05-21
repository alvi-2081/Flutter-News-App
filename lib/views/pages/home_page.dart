import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/news_services.dart';
import 'package:news_app/views/pages/news_details_page.dart';
import 'package:news_app/views/widgets/home_title_widget.dart';
import 'package:news_app/views/widgets/recommendation_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              // const SizedBox(height: 16.0),
              // const HomeTitleWidget(title: 'Breaking News'),
              // const SizedBox(height: 8.0),
              // const CustomCarouselSlider(),
              // const SizedBox(height: 16.0),
              const HomeTitleWidget(title: 'Recommendation'),
              const SizedBox(height: 8.0),

              FutureBuilder<NewsModel?>(
                  future: getAllNews(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(
                                  CupertinoPageRoute(
                                    builder: (_) => NewsDetailsPage(
                                      articles: snapshot.data!.articles![index],
                                    ),
                                  ),
                                )
                                .then((value) => setState(
                                      () {},
                                    ));
                          },
                          child: RecommendationItem(
                              articles: snapshot.data!.articles![index]),
                        ),
                      );
                    } else {
                      return const SizedBox(
                        height: 350,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      );
                    }
                  }),
              // ...news
              //     .map((newsItem) => Padding(
              //           padding: const EdgeInsets.only(bottom: 16.0),
              //           child: InkWell(
              //             onTap: () {
              //               final index = news.indexOf(newsItem);

              //               Navigator.of(context, rootNavigator: true)
              //                   .push(
              //                     CupertinoPageRoute(
              //                       builder: (_) => NewsDetailsPage(
              //                         articles: index,
              //                       ),
              //                     ),
              //                   )
              //                   .then((value) => setState(
              //                         () {},
              //                       ));
              //             },
              //             child: RecommendationItem(articles: newsItem),
              //           ),
              //         ))
              //     .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
