class Peso {
  final int _id;
  final double _peso;
  final String _Date;

  Peso(
    this._id,
    this._peso,
    this._Date,
  );
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'peso': _peso,
      'date': _Date,
    };
  }
}
