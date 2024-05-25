import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_newsapi/features/news/domain/usecases/get_news_list.dart';
import 'package:flutter_newsapi/features/news/presentation/cubits/news_cubit.dart';
import 'package:flutter_newsapi/features/news/presentation/widgets/news_card.dart';
import 'package:flutter_newsapi/features/news/presentation/widgets/search_text_field.dart';
import 'package:flutter_newsapi/main.dart';

@RoutePage()
class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final bloc = NewsCubit(getIt<GetNewsList>());
  final scrollController = ScrollController();
  bool loadMore = false;

  @override
  void initState() {
    bloc.getNews();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !loadMore) {
        loadMore = true;
        bloc.loadMore();
        loadMore = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {
            if (state.status == NewsStatus.failure) {
              final snackBar = SnackBar(
                content: Text(
                  state.errorModel?.message ?? '',
                ),
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          bloc: bloc,
          builder: (context, state) {
            return Stack(
              children: [
                NestedScrollView(
                  // floatHeaderSlivers: true,
                  headerSliverBuilder: (context, innerBoxScrolled) => [
                    SliverAppBar(
                      // floating: true,
                      // snap: true,
                      title: Container(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          top: 10,
                        ),
                        child: SearchTextField(
                          onSearch: (value) async {
                            bloc.searchNews(query: value);
                          },
                        ),
                      ),
                    ),
                  ],
                  body: RefreshIndicator(
                    onRefresh: () async {
                      bloc.refresh();
                    },
                    child: ListView.builder(
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        final news = state.news[index];

                        return NewsCard(
                          key: Key(index.toString()),
                          url: news.url,
                          title: news.title,
                          author: news.author,
                          publishedDate: news.publishedAt,
                          description: news.description,
                          urlImage: news.urlToImage,
                        );
                      },
                      itemCount: state.news.length,
                    ),
                  ),
                ),
                if (state.status == NewsStatus.loading && state.news.isNotEmpty)
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                if (state.status == NewsStatus.loading && state.news.isEmpty)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                if (state.status == NewsStatus.failure && state.news.isEmpty)
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No news to be displayed here'),
                        ],
                      ),
                    ],
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
