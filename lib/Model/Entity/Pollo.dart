class Pollo {
  final int _pollo;
  final String _Date;

  Pollo(
    this._pollo,
    this._Date,
  );
  Map<String, dynamic> toMap() {
    return {
      'pollo': _pollo,
      'date': _Date,
    };
  }
}
