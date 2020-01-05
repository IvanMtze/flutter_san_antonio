class Peso {
  final double _peso;
  final String _Date;

  Peso(
    this._peso,
    this._Date,
  );
  Map<String, dynamic> toMap() {
    return {
      'peso': _peso,
      'date': _Date,
    };
  }
}
