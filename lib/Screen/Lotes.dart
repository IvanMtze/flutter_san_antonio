import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Data/Dao/DaoPollos.dart';

final _myController = TextEditingController();

class Lotes extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final myController = TextEditingController();
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Nuevo lote de pollos')),
        backgroundColor: Colors.white,
        body: Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Ingrese num. pollos",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                  controller: _myController,
                  onTap: () {},
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Numero de pollos ingresados")),
              RaisedButton(
                onPressed: () {
                  save(myController.text);
                },
                child: const Text('Guardar', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ));
  }

  Future<bool> save(String numPollos) async {
    var dao = new DaoPollos(0, int.parse(numPollos));
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
