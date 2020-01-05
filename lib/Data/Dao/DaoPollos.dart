import 'package:date_format/date_format.dart';
import 'package:flutter_san_antonio/Data/DatabaseHelper.dart';
import 'package:flutter_san_antonio/Model/Entity/Pollo.dart';
import 'package:http/http.dart' as http;

class DaoPollos {
  final int _perdidas;
  final int _numPollos;
  String _date = "";
  final db = DatabaseHelper();

  DaoPollos(this._perdidas, this._numPollos) {
    _date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  }

  Future<bool> save() async {
    int _guardar = ((_numPollos == 0.0) ? _perdidas : _numPollos);

    var _URL = "http://127.0.0.1/ex," +
        _perdidas.toString() +
        "," +
        _numPollos.toString() +
        "," +
        _date;
    final response = await http.get(_URL);

    if (response.statusCode == 200) {
      db.insertaPollo(new Pollo(_guardar, _date));
      return true;
    } else {
      return false;
    }
  }
}
