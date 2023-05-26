class Credential {
  final String site;
  final String username;
  final String password;

  Credential({
    required this.site,
    required this.username,
    required this.password,
  });

  factory Credential.fromJson(Map<String, dynamic> json) {
    return Credential(
      site: json['site'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'site': site,
      };
}
