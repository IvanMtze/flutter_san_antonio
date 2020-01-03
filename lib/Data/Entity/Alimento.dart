class Alimento {
  final int _id;
  final double _alimento;
  final String _Date;

  Alimento(
    this._id,
    this._alimento,
    this._Date,
  );
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'alimento': _alimento,
      'date': _Date,
    };
  }
}
