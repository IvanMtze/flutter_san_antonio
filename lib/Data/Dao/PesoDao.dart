import 'package:date_format/date_format.dart';
import 'package:flutter_san_antonio/Model/Entity/Peso.dart';
import 'package:http/http.dart' as http;

import '../DatabaseHelper.dart';

class DaoPeso {
  final double _peso;
  final double _llegada;
  String _date = "";
  final db = DatabaseHelper();

  DaoPeso(this._llegada, this._peso) {
    _date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  }

  Future<bool> save() async {
    double _guardar = _llegada == 0.0 ? _peso : _llegada;

    var _URL = "127.0.0.1/pe," +
        _llegada.toString() +
        "," +
        _peso.toString() +
        "," +
        _date;
    final response = await http.get(_URL);

    if (response.statusCode == 200) {
      db.insertaPeso(new Peso(_guardar, _date));
      return true;
    } else {
      return false;
    }
  }
}
