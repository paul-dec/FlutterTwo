class User {
  final String pseudo;
  final String email;
  final String id;

  User({required this.pseudo, required this.email, required this.id});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        pseudo: json['pseudo'],
        email: json['email'],
        id: json['_id']
    );
  }
}