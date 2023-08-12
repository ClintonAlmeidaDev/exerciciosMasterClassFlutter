main() {
  print(retornaResultadoImc(altura: 1.91, peso: 200));
}

String retornaResultadoImc({required double altura, required double peso}) {
  double imc = peso / (altura * altura);

  if (imc < 18.5) {
    return "RESULTADO: ${imc.toStringAsFixed(1)} ABAIXO DO PESO";
  } else if (imc >= 18.5 && imc <= 24.9) {
    return "RESULTADO: ${imc.toStringAsFixed(1)} PESO NORMAL";
  } else if (imc >= 25 && imc <= 29.9) {
    return "RESULTADO: ${imc.toStringAsFixed(1)} ACIMA DO PESO (SOBREPESO)";
  } else if (imc >= 30 && imc <= 34.9) {
    return "RESULTADO: ${imc.toStringAsFixed(1)} OBESIDADE 1";
  } else if (imc >= 35 && imc <= 39.9) {
    return "RESULTADO: ${imc.toStringAsFixed(1)} OBESIDADE 2";
  } else {
    return "RESULTADO: ${imc.toStringAsFixed(1)} OBESIDADE 3";
  }
}
