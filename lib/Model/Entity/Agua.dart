class Agua {
  final double _agua;
  final String _Date;

  Agua(
    this._agua,
    this._Date,
  );
  Map<String, dynamic> toMap() {
    return {
      'agua': _agua,
      'date': _Date,
    };
  }
}
