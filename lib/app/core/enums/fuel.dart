enum FuelType {
  e10, e85, gazole, sp98, gplc, sp95
}

extension FuelTypeExtension on FuelType {
  static FuelType valueOf(String key) {
    return FuelType.values.firstWhere((element) => element.name == key.toLowerCase());
  }
}