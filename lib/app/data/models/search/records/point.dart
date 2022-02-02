class Point {
  double latitude;
  double longitude;

  Point(this.latitude, this.longitude);

  static Point? fromJson(Map<String, dynamic>? json) {
    return json == null ? null : Point(json["latitude"], json["longitude"]);
  }
}