import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Data/Dao/DaoAlimento.dart';

final _myController = TextEditingController();

class Alimento extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Center(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Ingrese alimento",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                  onTap: () {},
                  controller: _myController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: "Kilos de alimento llegados")),
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

  Future<bool> save(String consumido) async {
    var dao = new DaoAlimento(alimento: double.parse(consumido), llegada: 0.0);
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
