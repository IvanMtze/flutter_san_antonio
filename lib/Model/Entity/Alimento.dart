class Alimento {
  final double _alimento;
  final String _Date;

  Alimento(
    this._alimento,
    this._Date,
  );
  Map<String, dynamic> toMap() {
    return {
      'alimento': _alimento,
      'date': _Date,
    };
  }
}
