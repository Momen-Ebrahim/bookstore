import 'package:bookstore/cubits/get_books/get_Category_books/get_books_cubit.dart';
import 'package:bookstore/widgets/searchcardofbbok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCardOfCategoryListView extends StatefulWidget {
  const BookCardOfCategoryListView({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<BookCardOfCategoryListView> createState() =>
      _BookCardOfCategoryListViewState();
}

class _BookCardOfCategoryListViewState
    extends State<BookCardOfCategoryListView> {
  @override
  void initState() {
    super.initState();
    context.read<GetCategoryBooksCubit>().getCategorybooks(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<GetCategoryBooksCubit, GetCategoryState>(
              builder: (context, state) {
                if (state is GetCategoryBooksLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else if (state is GetCategoryBooksSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: ListView.builder(
                      itemCount: state.books.books!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 12, left: 12, bottom: 12.0),
                          child: SearchCardOfCartBook(
                            image:
                                state.books.books![index].image!.url.toString(),
                            title: state.books.books![index].title!,
                            price: state.books.books![index].price.toString(),
                            autherName: state.books.books![index].author!,
                            category: state.books.books![index].category!,
                             bookid: state.books.books![index].sId!,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Error'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
