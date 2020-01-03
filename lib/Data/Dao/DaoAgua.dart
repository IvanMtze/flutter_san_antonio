import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;

class DaoAgua {
  final double agua;
  final double llegada;
  String date = "";
  DaoAgua({
    this.llegada,
    this.agua,
  }) {
    date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  }

  Future<bool> save() async {
    double guardar = llegada == 0.0 ? agua : llegada;

    final response = await http.get("127.0.0.1/ag," +
        llegada.toString() +
        "," +
        agua.toString() +
        "," +
        date);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
