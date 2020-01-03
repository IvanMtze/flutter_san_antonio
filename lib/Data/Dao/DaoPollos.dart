import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;

class DaoPollos {
  final double perdidas;
  final double numPollos;
  String date = "";
  DaoPollos({
    this.perdidas,
    this.numPollos,
  }) {
    date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  }

  Future<bool> save() async {
    double guardar = ((numPollos == 0.0) ? perdidas : numPollos);

    final response = await http.get("http://127.0.0.1/ex," +
        perdidas.toString() +
        "," +
        numPollos.toString() +
        "," +
        date);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
