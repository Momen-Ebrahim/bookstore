class SignInModel {
  final String id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String password;
  final List<dynamic> favorites;
  final List<dynamic> bookmarks;
  final List<dynamic> books;
  final bool isAdmin;
  final int v;

  SignInModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.password,
    required this.favorites,
    required this.bookmarks,
    required this.books,
    required this.isAdmin,
    required this.v,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      favorites: json['Favorites'],
      bookmarks: json['Bookmarks'],
      books: json['Books'],
      isAdmin: json['isAdmin'],
      v: json['__v'],
    );
  }
}

class SignInResponse {
  final SignInModel signInModel;
  final String token;

  SignInResponse({
    required this.signInModel,
    required this.token,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      signInModel: SignInModel.fromJson(json['SignInModel']),
      token: json['token'],
    );
  }
}
