import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Data/Dao/DaoPollos.dart';

final _myController = TextEditingController();

class Mortandad extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      key: _scaffoldKey,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Ingrese mortandad",
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
              controller: _myController,
              decoration:
                  const InputDecoration(hintText: "Numero de pollos muertos")),
          RaisedButton(
            onPressed: () {
              save(_myController.text);
            },
            child: const Text('Guardar', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Future<bool> save(String numPollos) async {
    var dao = new DaoPollos(numPollos: 0.0, perdidas: double.parse(numPollos));
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
