class Bookid {
  Bookid({
    required this.book,
  });

  final Book? book;

  factory Bookid.fromJson(Map<String, dynamic> json) {
    return Bookid(
      book: json["book"] == null ? null : Book.fromJson(json["book"]),
    );
  }
}

class Book {
  Book({
    required this.image,
    required this.pdf,
    required this.id,
    required this.title,
    required this.author,
    required this.publishDate,
    required this.createdAt,
    required this.reviews,
    required this.description,
    required this.category,
    required this.price,
    required this.topseller,
    required this.onsale,
    required this.upcoming,
    required this.v,
    required this.averageRating,
    required this.newarrival,
  });

  final Image? image;
  final Image? pdf;
  final String? id;
  final String? title;
  final String? author;
  final DateTime? publishDate;
  final DateTime? createdAt;
  final List<Review> reviews;
  final String? description;
  final String? category;
  var price;
  final bool? topseller;
  final bool? onsale;
  final bool? upcoming;
  final int? v;
  var averageRating;
  final bool? newarrival;

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      pdf: json["pdf"] == null ? null : Image.fromJson(json["pdf"]),
      id: json["_id"],
      title: json["title"],
      author: json["author"],
      publishDate: DateTime.tryParse(json["publishDate"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      reviews: json["reviews"] == null
          ? []
          : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
      description: json["description"],
      category: json["category"],
      price: json["price"],
      topseller: json["topseller"],
      onsale: json["onsale"],
      upcoming: json["upcoming"],
      v: json["__v"],
      averageRating: json["averageRating"],
      newarrival: json["newarrival"],
    );
  }
}

class Image {
  Image({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      name: json["name"],
      url: json["url"],
    );
  }
}

class Review {
  Review({
    required this.id,
    required this.user,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.v,
  });

  final String? id;
  final User? user;
  var rating;
  final String? comment;
  final DateTime? createdAt;
  final int? v;

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      rating: json["rating"],
      comment: json["comment"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.image,
  });

  final String? id;
  final String? firstname;
  final String? lastname;
  final Image? image;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["_id"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
    );
  }
}
