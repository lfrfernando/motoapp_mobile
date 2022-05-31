import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadastro_page.dart';
import 'login_page.dart';

class paginaPrincipal extends StatefulWidget {
  const paginaPrincipal({Key? key}) : super(key: key);

  @override
  _paginaPrincipalState createState() => _paginaPrincipalState();
}

class _paginaPrincipalState extends State<paginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bem_vindo(a)!"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "images/logoFundo.jpeg",
              fit: BoxFit.fitWidth,
              //height: 300.0,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
              child: const Text(
                "\nEste aplicativo foi desenvolvido pensando em quem faz uso de serviços prestados por motoboys.\n"

                "Nosso intuito é o de trazer mais segurança e comodidade a você que faz uso deste tipo de serviço, "
                "interestaduais e intermunicipais tudo com muita rapidez e "
                    "segurança para quem contrata o serviço e para quem prestar.",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                //textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => loginPage()));
                      print('Botao login foi clicado');
                    },
                    icon: const Icon(Icons.person_outline),
                    label: const Text('Fazer acesso'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepOrange)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  cadastroPage()));
                      print('Botao cadastrar foi clicado');
                    },
                    icon: const Icon(Icons.person_outline),
                    label: const Text('Cadastrar-se'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepOrange)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
