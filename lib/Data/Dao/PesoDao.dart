import 'package:date_format/date_format.dart';
import 'package:http/http.dart' as http;

class DaoPeso {
  final double peso;
  final double llegada;
  String date = "";
  DaoPeso({
    this.llegada,
    this.peso,
  }) {
    date = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  }

  Future<bool> save() async {
    double guardar = llegada == 0.0 ? peso : llegada;

    final response = await http.get("127.0.0.1/pe," +
        llegada.toString() +
        "," +
        peso.toString() +
        "," +
        date);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
