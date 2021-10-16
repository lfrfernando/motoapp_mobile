import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:motoapp_faitec2021/entity/dados_login.dart';
import 'package:motoapp_faitec2021/entity/usuario.dart';
import 'package:motoapp_faitec2021/pages/pagina_cliente.dart';
import 'package:motoapp_faitec2021/pages/pagina_motoboy.dart';

const _request = "http://192.168.1.109:8082/api/v1/account/dologin";

class loginPage extends StatefulWidget {
  late String email;

  late String senha;

  //const loginPage({Key? key}) : super(key: key);
  //set senha(String senha) {}
  //set email(String email) {}

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _infoText = "Informe seus Dados";

  Object? get motoboy => null;

  Object? get cliente => null;

  void _resetFields() {
    setState(() {
      emailController.text = "";
      senhaController.text = "";
      _infoText = "Informe seus Dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  Future<void> efetuarLogin(loginPage usuario) async {
    //var userJson = jsonEncode(Usuario);

    Uri url = Uri.parse(_request);
    var response = await http.post(url);

    /*http.Response response = await http.post(_request,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },

        body: userJson);*/
    Usuario usuario = Usuario.                                   fromJson(jsonDecode(response.body));
    if (usuario.id != null) {
      //_showDialogSuccessUsuario(usuario.tipo,usuario);
      _resetFields();
    } else {
      _showDialogFailed();
    }
  }

  void _showDialogSuccessUsuario(int tipoUsuario, Usuario user) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (tipoUsuario == cliente) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => paginaCliente()));
          });
        }
        if (tipoUsuario == motoboy) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => pagina_motoboy()));
          });
        }
        // retorna um objeto do tipo Dialog
        return const AlertDialog(
          title: Text("Acesso efetuado com sucesso!"),
        );
      },
    );
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
          title: Text("Não foi possível efetuar o acesso!"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          //change your color here ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          title: const Text("Informe seus dados."),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/logo.jpeg",
                    fit: BoxFit.cover,
                    height: 100.0,
                  ),
                  //Icon(Icons.person_outline, size: 120.0, color: Colors.red),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: "Email:",
                      labelStyle: TextStyle(color: Colors.red),
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontSize: 25.0),
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
                        labelStyle: TextStyle(color: Colors.red)),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontSize: 25.0),
                    controller: senhaController,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return "Insira sua Senha!";
                      }
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 30.0),
                    width: 150.0,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          loginPage userLogin = loginPage();
                          userLogin.email = emailController.text;
                          userLogin.senha = senhaController.text;
                          efetuarLogin(userLogin);
                        } else {
                          _showDialogFailed();
                        }
                        print('Botao de acessar foi clicado');
                      },
                      child: const Text(
                        "Acessar",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                      color: Colors.deepOrange,
                    ),
                  ),
                ],
              ),
            )));
  }
}

pagina_motoboy() {}
