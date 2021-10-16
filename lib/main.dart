import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motoapp_faitec2021/pages/pagina_principal.dart';

void main() {
  runApp(MaterialApp(
    //title: "Contador de Pessoas",
    home: home(),
  ));
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/logoPreta.jpeg",
          fit: BoxFit.cover,
          height: 1000,
          //width: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: TextButton(
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  paginaPrincipal()));
                      print('Botao de entrar foi clicado');
                    },
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
