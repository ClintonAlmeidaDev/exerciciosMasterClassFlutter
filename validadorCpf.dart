void main(List<String> args) {
  print(validadorCpf('12345678910'));
  //87210964060
}

String validadorCpf(String cpf) {
  List<int> intCpf = separarTodosDigitosCpf(cpf);
  int primeiroDigito = calculaPrimeiroDigito(cpf);
  int segundoDigito = calculaSegundoDigito(cpf);

  if (primeiroDigito == intCpf[intCpf.length - 2] ||
      segundoDigito == intCpf[intCpf.length - 1]) {
    return "CPF VALIDO";
  } else {
    return "CPF INVALIDO";
  }
}

List<int> separarTodosDigitosCpf(String cpf) {
  List<String> listaCpf = cpf.split('');
  List<int> intCpf = listaCpf.map(int.parse).toList();
  return intCpf;
}

int calculaPrimeiroDigito(String cpf) {
  List<int> intCpf = separarTodosDigitosCpf(cpf);

  List<int> listaSomada = separaOitoDigitos(intCpf);

  int restoDaDivisao = retornaRestoDaDivisao(listaSomada);

  int digitoVerificador = retornaValorDigitoVerificador(restoDaDivisao);

  return digitoVerificador;
}

int calculaSegundoDigito(String cpf) {
  List<int> intCpf = separarTodosDigitosCpf(cpf);

  List<int> listaSomada = separaNoveDigitos(intCpf);

  int restoDaDivisao = retornaRestoDaDivisao(listaSomada);

  int digitoVerificador = retornaValorDigitoVerificador(restoDaDivisao);

  return digitoVerificador;
}

int retornaValorDigitoVerificador(int restoDaDivisao) {
  int digitoVerificador = 0;
  if (restoDaDivisao < 2) {
    digitoVerificador = 0;
  } else if (restoDaDivisao >= 2) {
    digitoVerificador = 11 - restoDaDivisao;
  }
  return digitoVerificador;
}

int retornaRestoDaDivisao(List<int> listaSomada) {
  int somaTotalCpf = 0;
  int restoDaDivisao = 0;
  int multiplicadorCrescente = 2;
  for (var outraListaCpf in listaSomada.reversed.toList()) {
    int valorDaSoma = (multiplicadorCrescente * outraListaCpf);
    somaTotalCpf += valorDaSoma;
    multiplicadorCrescente += 1;
  }
  restoDaDivisao = somaTotalCpf % 11;
  return restoDaDivisao;
}

List<int> separaOitoDigitos(List<int> intCpf) {
  List<int> listaSomada = [];
  for (var novaListaCpf in intCpf.getRange(0, intCpf.length - 2)) {
    listaSomada.add(novaListaCpf);
  }
  return listaSomada;
}

List<int> separaNoveDigitos(List<int> intCpf) {
  List<int> listaSomada = [];
  for (var novaListaCpf in intCpf.getRange(0, intCpf.length - 1)) {
    listaSomada.add(novaListaCpf);
  }
  return listaSomada;
}
