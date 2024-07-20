import 'package:bookstore/core/errors/errorbooks.dart';
import 'package:bookstore/cubits/get_books/get_user_own__books/get_books_cubit.dart';
import 'package:bookstore/cubits/get_books/search_books/get_books_cubit.dart';
import 'package:bookstore/generated/l10n.dart';
import 'package:bookstore/widgets/book_card.dart';
import 'package:bookstore/widgets/custom_loading_small_card_grid_view_static.dart';
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
  bool ownershipCheckComplete = false;
  String filter = '';
  String search = '';

  final Map<String, bool> ownedBooks = {};
  void checkIfOwned(String bookId) {
    final ownBooksState = context.read<GetownBooksCubit>().state;

    if (ownBooksState is GetownBooksSuccess) {
      final ownBooks = ownBooksState.books.books!;

      for (var book in ownBooks) {
        if (book.sId == bookId) {
          ownedBooks[bookId] = true;
          ownershipCheckComplete = true;
          return;
        }
      }
      ownedBooks[bookId] = false;
      ownershipCheckComplete = true;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<GetownBooksCubit>().getownBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            isempty = false;
                            search = value;
                          });
                          context
                              .read<GetsearchBooksCubit>()
                              .getsearchbooks(value, filter);
                        } else {
                          setState(() {
                            isempty = true;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: S.of(context).Search,
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 20),
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
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                S.of(context).filterby,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                  title: Text(
                                    S.of(context).AllBooks,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      isempty = false;
                                      Navigator.pop(context);
                                      context
                                          .read<GetsearchBooksCubit>()
                                          .getsearchbooks(search, filter);
                                    });
                                  }),
                              ListTile(
                                title: Text(
                                  S.of(context).sortbyhighestprice,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);

                                  context
                                      .read<GetsearchBooksCubit>()
                                      .getsearchbooks(search, "-price");
                                  setState(() {
                                    filter = "-price";
                                    isempty = false;
                                  });
                                },
                              ),
                              ListTile(
                                title: Text(
                                  S.of(context).sortbylowestprice,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  context
                                      .read<GetsearchBooksCubit>()
                                      .getsearchbooks(search, 'price');
                                  setState(() {
                                    filter = "price";
                                    isempty = false;
                                  });
                                },
                              ),
                              ListTile(
                                title: Text(
                                  S.of(context).sortbyoldestbooks,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  context
                                      .read<GetsearchBooksCubit>()
                                      .getsearchbooks(search, 'publishDate');
                                  setState(() {
                                    filter = "publishDate";
                                    isempty = false;
                                  });
                                },
                              ),
                              ListTile(
                                title: Text(
                                  S.of(context).sortbynewestbooks,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  context
                                      .read<GetsearchBooksCubit>()
                                      .getsearchbooks(search, '-publishDate');
                                  setState(() {
                                    filter = "-publishDate";
                                    isempty = false;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]);
                          });
                    },
                    icon: const Icon(
                      Icons.filter_alt,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              !isempty
                  ? BlocBuilder<GetsearchBooksCubit, GetSearchState>(
                      builder: (context, state) {
                      if (state is GetSearchBooksLoading) {
                        return const CustomLoadingSmallCardGridViewStatic();
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
                                  colorFilter: const ColorFilter.mode(
                                    Colors.black,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  S.of(context).Nobookfound,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: GridView.builder(
                                padding: const EdgeInsets.all(10),
                                itemCount: state.books.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: .45,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemBuilder: (BuildContext context, int index) {
                                  final searchedBook = state.books[index];
                                  if (!ownedBooks
                                      .containsKey(searchedBook.sId)) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      checkIfOwned(searchedBook.sId!);
                                      setState(() {});
                                    });
                                  }
                                  final isOwned =
                                      ownedBooks[searchedBook.sId] ?? false;
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: (ownershipCheckComplete)
                                        ? BookCard(
                                            category:
                                                state.books[index].category!,
                                            bookid: state.books[index].sId!,
                                            title: state.books[index].title!,
                                            autherName:
                                                state.books[index].author!,
                                            price: isOwned
                                                ? 'Owned'
                                                : state.books[index].onsale!
                                                    ? state
                                                        .books[index].saleprice!
                                                        .toString()
                                                    : state.books[index].price!
                                                        .toString(),
                                            rating: state
                                                .books[index].averageRating!
                                                .toDouble(),
                                            description:
                                                state.books[index].description!,
                                            image: state.books[index].image!.url
                                                .toString(),
                                          )
                                        : Container(),
                                  );
                                }),
                          );
                        }
                      } else {
                        return const BooksError();
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
                          colorFilter: const ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          S.of(context).Findyourbook,
                          style: const TextStyle(
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
