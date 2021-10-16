//import 'dart:convert';

class Usuario {
  int id;
  String nomeUsuario;
  String nomeCompleto;
  String senha;
  String email;
  String dataNascimento;
  String tipo;
  String telefone;
  String cpf;

  Usuario({
    required this.id,
    required this.nomeUsuario,
    required this.nomeCompleto,
    required this.senha,
    required this.email,
    required this.dataNascimento,
    required this.tipo,
    required this.telefone,
    required this.cpf,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'] ?? 0,
      senha: json['senha'],
      telefone: json['telefone'],
      nomeUsuario: json['nomeUsuario'],
      dataNascimento: json['dataNascimento'],
      email: json['email'],
      cpf: json['cpf'],
      nomeCompleto: json['nomeCompleto'],
      tipo: json['tipo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomeUsuario'] = this.nomeUsuario;
    data['nomeCompleto'] = this.nomeCompleto;
    data['senha'] = this.senha;
    data['email'] = this.email;
    data['dataNascimento'] = this.dataNascimento;
    data['tipo'] = this.tipo;
    data['telefone'] = this.telefone;
    data['cpf'] = this.cpf;
    return data;
  }

  //@override
//  String toString() {
  //  return 'Usuario{id: $id, nomeUsuario: $nomeUsuario, nomeCompleto: $nomeCompleto, senha: $senha, email: $email, dataNascimento: $dataNascimento, tipo: $tipo, telefone: $telefone, cpf: $cpf}';
  //}
}
