import 'package:flutter/material.dart';
import 'package:flutter_san_antonio/Data/Dao/DaoAgua.dart';

final _myController = TextEditingController();

class Agua extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  Agua({Key key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
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
              save(_myController.text);
            },
            child: const Text('Guardar', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Future<bool> save(String consumido) async {
    var dao = new DaoAgua(double.parse(consumido), 0.0);
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
