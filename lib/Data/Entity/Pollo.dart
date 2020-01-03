class Pollo {
  final int _id;
  final double _pollo;
  final String _Date;

  Pollo(
    this._id,
    this._pollo,
    this._Date,
  );
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'pollo': _pollo,
      'date': _Date,
    };
  }
}
