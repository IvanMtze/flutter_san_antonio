import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Data/Dao/PesoDao.dart';

final _myController = TextEditingController();

class Peso_promedio extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            backgroundColor: Colors.red, title: const Text('Peso promedio')),
        backgroundColor: Colors.white,
        body: Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Ingrese peso",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                  onTap: () {},
                  controller: _myController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Peso promedio")),
              RaisedButton(
                onPressed: () {
                  save(_myController.text);
                },
                child: const Text('Guardar', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ));
  }

  Future<bool> save(String numPollos) async {
    var dao = new DaoPeso(llegada: 0.0, peso: double.parse(numPollos));
    bool val = await dao.save();
    if (val == true) {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("OK")));
    } else {
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text("Something went wrong!")));
    }
  }
}
