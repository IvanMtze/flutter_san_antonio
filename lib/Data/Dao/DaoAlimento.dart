import 'package:date_format/date_format.dart';
import 'package:flutter_san_antonio/Model/Entity/Alimento.dart';
import 'package:http/http.dart' as http;

import '../DatabaseHelper.dart';

class DaoAlimento {
  final double _alimento;
  final double _llegada;
  String _date = "";
  final db = DatabaseHelper();

  DaoAlimento(this._alimento, this._llegada) {
    _date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  }

  Future<bool> save() async {
    //double _alimentoInsertar = _llegada == 0.0 ? _alimentoTotal - _guardar : _alimentoTotal + _guardar;

    String _URL = "127.0.0.1//al," +
        _llegada.toString() +
        "," +
        _alimento.toString() +
        "," +
        _date;
    final response = await http.get(_URL);

    if (response.statusCode == 200) {
      db.insertaAlimento(new Alimento(_alimento, _date));
      return true;
    } else {
      return false;
    }
  }
}
