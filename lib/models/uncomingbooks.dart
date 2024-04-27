class UpcomingBooks {
  List<Book>? book;

  UpcomingBooks({this.book});

  UpcomingBooks.fromJson(Map<String, dynamic> json) {
    if (json['book'] != null) {
      book = <Book>[];
      json['book'].forEach((v) {
        book!.add(Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (book != null) {
      data['book'] = book!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Book {
  Image? image;
  String? sId;
  String? title;
  String? author;
  String? publishDate;
  String? createdAt;
  List<void>? reviews;
  String? description;
  String? category;
  bool? topseller;
  bool? onsale;
  bool? upcoming;
  bool? newarrival;
  int? averageRating;
  int? iV;

  Book({
    this.image,
    this.sId,
    this.title,
    this.author,
    this.publishDate,
    this.createdAt,
    this.reviews,
    this.description,
    this.category,
    this.topseller,
    this.onsale,
    this.upcoming,
    this.newarrival,
    this.averageRating,
    this.iV,
  });

  Book.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    sId = json['_id'];
    title = json['title'];
    author = json['author'];
    publishDate = json['publishDate'];
    createdAt = json['createdAt'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews!.add(v);
      });
    }
    description = json['description'];
    category = json['category'];
    topseller = json['topseller'];
    onsale = json['onsale'];
    upcoming = json['upcoming'];
    newarrival = json['newarrival'];
    averageRating = json['averageRating'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['_id'] = sId;
    data['title'] = title;
    data['author'] = author;
    data['publishDate'] = publishDate;
    data['createdAt'] = createdAt;
    if (reviews != null) {
      data['reviews'] = reviews!;
    }
    data['description'] = description;
    data['category'] = category;
    data['topseller'] = topseller;
    data['onsale'] = onsale;
    data['upcoming'] = upcoming;
    data['newarrival'] = newarrival;
    data['averageRating'] = averageRating;
    data['__v'] = iV;
    return data;
  }
}

class Image {
  String? name;
  String? url;

  Image({this.name, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
