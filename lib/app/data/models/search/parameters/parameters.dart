class Parameters {
  String? citySearch;
  int rows;
  List<String> sort;

  Parameters(this.citySearch, this.rows, this.sort);

  factory Parameters.fromJson(Map<String, dynamic> json) {
    return Parameters(json["citySearch"], json["rows"], List<String>.from(json['sort']));
  }
}