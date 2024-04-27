import 'package:bookstore/cubits/get_books/search_books%20-%20Copy/get_books_cubit.dart';
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
  // List<Map<String, String>> books = [
  //   {
  //     'image': 'assets/images/bestDeals.png',
  //     'type': 'Adult Narrative',
  //     'title': 'book1',
  //     'author': 'Cristina Camerena, Lady Desatia',
  //     'price': '\$17.00',
  //   },
  //   {
  //     'image': 'assets/images/topBooks2.png',
  //     'title': 'book2',
  //     'author': 'Kate Racculia',
  //     'price': '\$25.00',
  //     'type': 'Novel',
  //   },
  //   {
  //     'image': 'assets/images/bestDeals.png',
  //     'type': 'Adult Narrative',
  //     'title': 'book3',
  //     'author': 'Cristina Camerena, Lady Desatia',
  //     'price': '\$17.00',
  //   },
  //   {
  //     'image': 'assets/images/topBooks2.png',
  //     'title': 'book4',
  //     'author': 'Kate Racculia',
  //     'price': '\$25.00',
  //     'type': 'Novel',
  //   },
  //   {
  //     'image': 'assets/images/bestDeals.png',
  //     'type': 'Adult Narrative',
  //     'title': 'book5',
  //     'author': 'Cristina Camerena, Lady Desatia',
  //     'price': '\$17.00',
  //   },
  //   {
  //     'image': 'assets/images/topBooks2.png',
  //     'title': 'book6',
  //     'author': 'Kate Racculia',
  //     'price': '\$25.00',
  //     'type': 'Novel',
  //   },
  //   {
  //     'image': 'assets/images/bestDeals.png',
  //     'type': 'Adult Narrative',
  //     'title': 'book7',
  //     'author': 'Cristina Camerena, Lady Desatia',
  //     'price': '\$17.00',
  //   },
  //   {
  //     'image': 'assets/images/topBooks2.png',
  //     'title': 'book8',
  //     'author': 'Kate Racculia',
  //     'price': '\$25.00',
  //     'type': 'Novel',
  //   },
  // ];
  // List<Map<String, String>> foundBooks = [];
  // bool isfound = true;

  // void searchBook(String search) {
  //   if (search.isEmpty) {
  //     setState(() {
  //       foundBooks = [];
  //       isfound = true;
  //     });
  //   } else {
  //     setState(() {
  //       foundBooks = books
  //           .where((element) =>
  //               element['title']!.toLowerCase().contains(search.toLowerCase()))
  //           .toList();
  //       if (foundBooks.isEmpty) {
  //         isfound = false;
  //       }
  //     });
  //   }
  // }

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
                                    author: state.books[index].author!,
                                    price: state.books[index].price!.toString(),
                                    type: state.books[index].category!,
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
