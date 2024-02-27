import 'package:flutter/material.dart';

enum Categories {
  Fiction,
  NonFiction,
  Mystery,
  Fantasy,
  Romance,
  ScienceFiction,
  Biography,
  SelfHelp,
  History,
  Horror,
  Thriller,
  Poetry,
  Children,
  YoungAdult,
  Business,
  Travel,
  Cookbook,
  Art,
  Philosophy,
  Religion,
  Science,
  Technology,
  Health,
  Fitness,
  Sports,
  Education,
  Psychology,
  Sociology,
  Music,
  Gardening,
  DIY,
  Comics,
  GraphicNovels,
  Crime,
  Drama,
  ActionAdventure,
  Classics,
  Humor,
  Anthology,
  ShortStories,
  Classic,
  Comic
}

class Category {
  final Categories category;
  final String name;
  final String image;
  final Color color;

  Category({
    required this.category,
    required this.name,
    required this.image,
    required this.color,
  });
}
