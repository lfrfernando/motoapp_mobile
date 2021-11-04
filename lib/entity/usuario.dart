//import 'dart:convert';

import 'dart:convert';

class Usuario {
  int id;
  String nomeUsuario;
  String nomeCompleto;
  String senha;
  String email;
  //String dataNascimento;
  //DateTime criadoEm;
  //DateTime ultimoAcesso;
  String tipo;
  String telefone;
  String cpf;

  Usuario({
    required this.id,
    required this.nomeUsuario,
    required this.nomeCompleto,
    required this.senha,
    required this.email,
    //required this.dataNascimento,
    //required this.criadoEm,
    //required this.ultimoAcesso,
    required this.tipo,
    required this.telefone,
    required this.cpf,
  });



  Object? get body => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomeUsuario'] = this.nomeUsuario;
    data['nomeCompleto'] = this.nomeCompleto;
    data['senha'] = this.senha;
    data['email'] = this.email;
    //data['dataNascimento'] = this.dataNascimento;
    //data['criadoEm'] = this.criadoEm;
    //data['ultimoAcesso'] = this.ultimoAcesso;
    data['tipo'] = this.tipo;
    data['telefone'] = this.telefone;
    data['cpf'] = this.cpf;
    return data;
  }

  //String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario{id: $id, nomeUsuario: $nomeUsuario, nomeCompleto: $nomeCompleto, senha: $senha, email: $email,  tipo: $tipo, telefone: $telefone, cpf: $cpf}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nomeUsuario': this.nomeUsuario,
      'nomeCompleto': this.nomeCompleto,
      'senha': this.senha,
      'email': this.email,
      //'dataNascimento': this.dataNascimento,
      //'criadoEm': this.criadoEm,
      //'ultimoAcesso': this.ultimoAcesso,
      'tipo': this.tipo,
      'telefone': this.telefone,
      'cpf': this.cpf,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] as int,
      nomeUsuario: map['nomeUsuario'] as String,
      nomeCompleto: map['nomeCompleto'] as String,
      senha: map['senha'] as String,
      email: map['email'] as String,
      //dataNascimento: map['dataNascimento'] as String,
      //criadoEm: map['criadoEm'],
      //ultimoAcesso: map['ultimoAcesso'],
      tipo: map['tipo'] as String,
      telefone: map['telefone'] as String,
      cpf: map['cpf'] as String,
    );
  }
}

