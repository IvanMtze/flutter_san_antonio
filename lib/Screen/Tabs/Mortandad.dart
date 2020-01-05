import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Data/Dao/DaoPollos.dart';

final _myController = TextEditingController();

class Mortandad extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  Mortandad({Key key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
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
    var dao = new DaoPollos(0, int.parse(numPollos));
    bool val = await dao.save();
    if (val == true) {
      scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text("OK")));
    } else {
      scaffoldKey.currentState.showSnackBar(
          new SnackBar(content: new Text("Something went wrong!")));
    }
  }
}
