import 'package:flutter/material.dart';

class paginaCliente extends StatefulWidget {
  const paginaCliente({Key? key}) : super(key: key);

  @override
  _paginaClienteState createState() => _paginaClienteState();

}

 class _paginaClienteState extends State<paginaCliente> {
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        //change your color here ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: const Text("Bem vindo(a) Cliente"),
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
