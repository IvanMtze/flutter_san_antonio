class Agua {
  final int _id;
  final double _agua;
  final String _Date;

  Agua(
    this._id,
    this._agua,
    this._Date,
  );
  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'agua': _agua,
      'date': _Date,
    };
  }
}
