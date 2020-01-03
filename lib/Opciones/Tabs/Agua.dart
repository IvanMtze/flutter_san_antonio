import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Data/Dao/DaoAgua.dart';

final _myController = TextEditingController();

class Agua extends StatelessWidget {
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
            "Ingrese agua",
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
              onTap: () {},
              controller: _myController,
              decoration:
                  const InputDecoration(hintText: "Litros de agua consumida")),
          RaisedButton(
            onPressed: () {
              _scaffoldKey.currentState.showSnackBar(
                  new SnackBar(content: new Text("Something went wrong!")));
              save(_myController.text);
              _scaffoldKey.currentState.showSnackBar(
                  new SnackBar(content: new Text("Something went wrong!")));
            },
            child: const Text('Guardar', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Future<bool> save(String consumido) async {
    var dao = new DaoAgua(agua: double.parse(consumido), llegada: 0.0);
    bool val = await dao.save();
    if (val == true) {
      debugPrint("hola");
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("OK")));
    } else {
      debugPrint("as");
      _scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text("Something went wrong!")));
    }
  }
}
