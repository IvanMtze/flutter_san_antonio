import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;

class DaoAlimento {
  final double alimento;
  final double llegada;
  String date = "";
  DaoAlimento({
    this.alimento,
    this.llegada,
  }) {
    date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  }

  Future<bool> save() async {
    //double alimentoInsertar = llegada == 0.0 ? alimentoTotal - guardar : alimentoTotal + guardar;

    final response = await http.get("127.0.0.1//al," +
        llegada.toString() +
        "," +
        alimento.toString() +
        "," +
        date);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
