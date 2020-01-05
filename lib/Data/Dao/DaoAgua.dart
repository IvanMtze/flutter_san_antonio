import 'package:date_format/date_format.dart';
import 'package:flutter_san_antonio/Model/Entity/Agua.dart';
import 'package:http/http.dart' as http;

import '../DatabaseHelper.dart';

class DaoAgua {
  final double _agua;
  final double _llegada;
  String _date = "";
  final db = DatabaseHelper();

  DaoAgua(this._llegada, this._agua) {
    _date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  }

  Future<bool> save() async {
    double _guardar = _llegada == 0.0 ? _agua : _llegada;

    var _URL = "http://127.0.01," +
        _llegada.toString() +
        "," +
        _agua.toString() +
        "," +
        _date;

    final response = await http.get(_URL);

    if (response.statusCode == 200) {
      db.insertaAgua(new Agua(_guardar, _date));
      return true;
    } else {
      return false;
    }
  }
}
