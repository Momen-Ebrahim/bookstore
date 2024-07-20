class GetUserInfoModel {
  FindUser? findUser;

  GetUserInfoModel({this.findUser});

  GetUserInfoModel.fromJson(Map<String, dynamic> json) {
    findUser =
        json['FindUser'] != null ? FindUser.fromJson(json['FindUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (findUser != null) {
      data['FindUser'] = findUser!.toJson();
    }
    return data;
  }
}

class FindUser {
  Image? image;
  String? sId;
  String? firstname;
  String? lastname;
  String? username;
  String? email;
  String? password;
  List<dynamic>? favorites;
  List<dynamic>? bookmarks;
  List<dynamic>? books;
  bool? isAdmin;
  int? iV;

  FindUser(
      {this.image,
      this.sId,
      this.firstname,
      this.lastname,
      this.username,
      this.email,
      this.password,
      this.favorites,
      this.bookmarks,
      this.books,
      this.isAdmin,
      this.iV});

  FindUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    favorites = json['Favorites'] != null
        ? List<dynamic>.from(json['Favorites'])
        : null;
    bookmarks = json['Bookmarks'] != null
        ? List<dynamic>.from(json['Bookmarks'])
        : null;
    books = json['Books'] != null ? List<dynamic>.from(json['Books']) : null;
    isAdmin = json['isAdmin'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['_id'] = sId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    if (favorites != null) {
      data['Favorites'] = favorites;
    }
    if (bookmarks != null) {
      data['Bookmarks'] = bookmarks;
    }
    if (books != null) {
      data['Books'] = books;
    }
    data['isAdmin'] = isAdmin;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
