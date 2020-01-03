import 'package:flutter/material.dart';

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red, title: const Text('Configuracion')),
        backgroundColor: Colors.white,
        body: Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Ingrese la IP",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                  onTap: () {},
                  decoration: const InputDecoration(hintText: "IP")),
              RaisedButton(
                onPressed: () {},
                child: const Text('Guardar', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ));
  }
}
