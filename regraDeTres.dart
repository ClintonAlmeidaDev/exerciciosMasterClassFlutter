void main(List<String> args) {
  print(calculaRegraDeTres(3, 5, 7));
}

String calculaRegraDeTres(
    [double? grupo11, double? grupo12, double? grupo21, double? grupo22]) {
  return grandezasProporcionais(grupo11, grupo12, grupo21, grupo22);
}

String grandezasProporcionais(double? x, double? y, double? w, double? z) {
  z = (w! * y!) / x!;
  return z.toStringAsFixed(2);
}

String grandezasInversamenteProporcionais(
    double? x, double? y, double? w, double? z) {
  z = (x! * y!) / w!;
  return z.toStringAsFixed(2);
}
