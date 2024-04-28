import 'package:bookstore/cubits/get_books/search_books/get_books_cubit.dart';
import 'package:bookstore/widgets/searchcardofbbok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isempty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  // searchBook(value);
                  if (value.isNotEmpty) {
                    setState(() {
                      isempty = false;
                    });
                    context.read<GetsearchBooksCubit>().getsearchbooks(value);
                  } else {
                    setState(() {
                      isempty = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              !isempty
                  ? BlocBuilder<GetsearchBooksCubit, GetSearchState>(
                      builder: (context, state) {
                      if (state is GetSearchBooksLoading) {
                        return const Center(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        );
                      } else if (state is GetSearchBooksSuccess) {
                        if (state.books.isEmpty) {
                          return Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .17,
                                ),
                                SvgPicture.asset(
                                  'assets/images/svg/notfound.svg',
                                  height: 200,
                                  width: 200,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'No book found ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.books.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SearchCardOfCartBook(
                                    image: state.books[index].image!.url
                                        .toString(),
                                    title: state.books[index].title!,
                                    autherName: state.books[index].author!,
                                    price: state.books[index].price!.toString(),
                                    category: state.books[index].category!,
                                    bookid: state.books[index].sId!,
                                  ));
                            },
                          );
                        }
                      } else {
                        return const Center(
                          child: Text('Failed to load books: '),
                        );
                      }
                    })
                  : Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .17,
                        ),
                        SvgPicture.asset(
                          'assets/images/svg/find-book-icon.svg',
                          height: 200,
                          width: 200,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Find your book',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
