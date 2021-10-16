//import 'dart:convert';

class Login {
  String email;
  String senha;

  Login({
    required this.email,
    required this.senha,
  });

 factory Login.fromJson(Map<String, dynamic> json) {
   return Login(
     email: json['email'],
     senha: json['senha'],
   );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['senha'] = this.senha;

    return data;
  }

  @override
  String toString() {
    return 'Login{email: $email, senha: $senha}';
  }

}
