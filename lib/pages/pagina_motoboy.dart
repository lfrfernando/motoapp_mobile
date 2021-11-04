import 'package:flutter/material.dart';

class paginaMotoboy extends StatefulWidget {
  const paginaMotoboy({Key? key}) : super(key: key);

  @override
  _paginaMotoboyState createState() => _paginaMotoboyState();
}

class _paginaMotoboyState extends State<paginaMotoboy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
    //change your color here ),
    centerTitle: true,
    backgroundColor: Colors.deepOrange,
    title: const Text("Bem vindo(a) Motoboy"),
    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
    actions: <Widget>[
    IconButton(
    icon: const Icon(Icons.refresh),
    onPressed: (){},
    )
    ],
    ),
    );
  }
}
