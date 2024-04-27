class AllBooks {
  Image? image;
  Image? pdf;
  bool? newarrival;
  String? sId;
  String? title;
  String? author;
  String? publishDate;
  String? createdAt;
  List<void>? reviews;
  String? description;
  String? category;
  var price;
  bool? topseller;
  bool? onsale;
  bool? upcoming;
  int? iV;
  int? saleprice;

  AllBooks(
      {this.image,
      this.pdf,
      this.newarrival,
      this.sId,
      this.title,
      this.author,
      this.publishDate,
      this.createdAt,
      this.reviews,
      this.description,
      this.category,
      this.price,
      this.topseller,
      this.onsale,
      this.upcoming,
      this.iV,
      this.saleprice});

  AllBooks.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    pdf = json['pdf'] != null ? Image.fromJson(json['pdf']) : null;
    newarrival = json['newarrival'];
    sId = json['_id'];
    title = json['title'];
    author = json['author'];
    publishDate = json['publishDate'];
    createdAt = json['createdAt'];
    if (json['reviews'] != null) {
      reviews = <void>[];
      json['reviews'].forEach((v) {
        reviews!.add(v);
      });
    }
    description = json['description'];
    category = json['category'];
    price = json['price'];
    topseller = json['topseller'];
    onsale = json['onsale'];
    upcoming = json['upcoming'];
    iV = json['__v'];
    saleprice = json['saleprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (pdf != null) {
      data['pdf'] = pdf!.toJson();
    }
    data['newarrival'] = newarrival;
    data['_id'] = sId;
    data['title'] = title;
    data['author'] = author;
    data['publishDate'] = publishDate;
    data['createdAt'] = createdAt;
    if (reviews != null) {
      data['reviews'] = reviews!.toList();
    }
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['topseller'] = topseller;
    data['onsale'] = onsale;
    data['upcoming'] = upcoming;
    data['__v'] = iV;
    data['saleprice'] = saleprice;
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
