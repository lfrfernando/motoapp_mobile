import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:motoapp_faitec2021/entity/usuario.dart';
import 'login_page.dart';
const _request = "http://192.168.0.110:8082/api/v1/account/create";

class cadastroPage extends StatefulWidget {
  const cadastroPage({Key? key}) : super(key: key);

  set tipo(String tipo) {}
  set dataNascimento(String dataNascimento) {}
  set cpf(String cpf) {}
  set senha(String senha) {}
  set email(String email) {}
  set telefone(String telefone) {}
  set nomeCompleto(String nomeCompleto) {}
  set nomeUsuario(String nomeUsuario) {}

  @override
  _cadastroPageState createState() => _cadastroPageState();
}

class _cadastroPageState extends State<cadastroPage> {

  Future<void> criaUsuario(Usuario user) async {
    var userJson = jsonEncode(user);
    http
        .post(Uri.parse(_request),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: userJson)
        .then((http.Response response) {
      print(response.statusCode);
      if (response.statusCode == 201) {
        _showDialogSuccess();
        _resetFields();
      } else if (response.statusCode == 406) {
        _showDialogFailed();
      }
    });
  }
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController nomeCompletoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController tipoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = "Informe seus Dados";

  void _resetFields() {
    setState(() {
      nomeUsuarioController.text = "";
      nomeCompletoController.text = "";
      emailController.text = "";
      senhaController.text = "";
      cpfController.text = "";
      telefoneController.text = "";
      dataNascimentoController.text = "";
      _infoText = "Informe seus Dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _showDialogSuccess() {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => loginPage()));
          });
          return const AlertDialog(
            title: Text('Cadastro efetuado com sucesso!'),
          );
        });
  }

  void _showDialogFailed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
        });
        // retorna um objeto do tipo Dialog
        return const AlertDialog(
          title: Text("Não foi possível efetuar o Cadastro!"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preencha os campos abaixo."),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image.asset(
                    "images/logo.jpeg",
                    fit: BoxFit.cover,
                    height: 380.0,
                  ),
                  //Icon(Icons.child_care, size: 120.0, color: Colors.red),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Nome de usuário:",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 25.0),
                    controller: nomeUsuarioController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira seu Nome de usuário!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Nome de Completo:",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 25.0),
                    controller: nomeCompletoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira seu Nome Completo!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email:",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 25.0),
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return "Insira seu Email!";
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                        labelText: "Senha:",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 25.0),
                    controller: senhaController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return "Insira sua Senha ou Insira uma senha de pelo menos 06 digitos.";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Cpf:",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 25.0),
                    controller: cpfController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira seu CPF!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Telefone:",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 25.0),
                    controller: telefoneController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return "Insira seu Telefone!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                        labelText: "Data de Nascimento:",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 25.0),
                    controller: dataNascimentoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira sua Data de Nascimento!";
                      }
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Cadastrar-se como?",
                        labelStyle: TextStyle(color: Colors.deepOrange)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.deepOrange, fontSize: 25.0),
                    controller: tipoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Defina como quer se cadastrar!";
                      }
                    },
                  ),

              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () async {
                      Usuario user = Usuario(id: 0, nomeUsuario:"", nomeCompleto:"", senha:"", email:"",  tipo:"", telefone:"", cpf:"" );
                      user.nomeUsuario = nomeUsuarioController.text;
                      user.nomeCompleto = nomeCompletoController.text;
                      user.telefone = telefoneController.text;
                      user.email = emailController.text;
                      user.senha = senhaController.text;
                      user.cpf = cpfController.text;
                      user.tipo = tipoController.text;
                      if (_formKey.currentState!.validate()) {
                        criaUsuario(user);

                      } else {
                        _showDialogFailed();
                      }
                    },
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.deepOrange,
                  ),
                ),
              )
                ]
              ),
            ))
    );
  }
}
