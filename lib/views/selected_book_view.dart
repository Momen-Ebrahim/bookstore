import 'package:bookstore/cubits/get_books/book_id/get_books_cubit.dart';
import 'package:bookstore/helper/api.dart';
import 'package:bookstore/helper/local_network.dart';
import 'package:bookstore/widgets/selected_book_card2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectedBookView extends StatefulWidget {
  const SelectedBookView({
    Key? key,
    required this.bookid,
    required this.title,
  }) : super(key: key);
  final String bookid;
  final String title;

  @override
  State<SelectedBookView> createState() => _SelectedBookViewState();
}

class _SelectedBookViewState extends State<SelectedBookView> {
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    context.read<GetBookidCubit>().getBookid(widget.bookid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushReplacementNamed(context, '/last_page_route');
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 32,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: BlocBuilder<GetBookidCubit, GeBooksidtate>(
              builder: (context, state) {
                // Inside BlocBuilder, access the book ID
                if (state is GetBookidSuccess && state.books.book != null) {
                  return IconButton(
                    icon: Icon(
                      FontAwesomeIcons.heart,
                      color: isFav ? Colors.red : Colors.black,
                      size: 24,
                    ),
                    onPressed: () async {
                      setState(() {
                        isFav = !isFav;
                      });
                      if (isFav) {
                        final response = await Api().post(
                          token: CacheNetwork.getCacheData(key: 'token'),
                          url:
                              'https://book-store-api-mu.vercel.app/User/Favorites/${state.books.book!.id!}',
                        );
                      } else {
                        final response = await Api().delete(
                          url:
                              'https://book-store-api-mu.vercel.app/User/Favorites/${state.books.book!.id!}',
                          token: CacheNetwork.getCacheData(key: 'token'),
                        );
                      }
                    },
                  );
                }
                // Return an empty container if state is not GetBookidSuccess or book is null
                return Container();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<GetBookidCubit, GeBooksidtate>(
                builder: (context, state) {
                  if (state is GeBookidLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (state is GetBookidSuccess) {
                    return SelectedBookCard2(
                      image: state.books.book!.image!.url.toString(),
                      title: state.books.book!.title!,
                      price: state.books.book!.price!.toString(),
                      category: state.books.book!.category!,
                      autherName: state.books.book!.author!,
                      description: state.books.book!.description!,
                      bookid: widget.bookid,
                      rating: state.books.book!.averageRating!.toDouble(),
                    );
                  } else if (state is GetBookidFailure) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
