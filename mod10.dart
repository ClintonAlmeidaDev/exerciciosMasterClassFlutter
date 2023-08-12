void main(List<String> args) {
  print(validarCartao('4916641859369080'));
}

String validarCartao(String numCartao) {
  List<int> numCartaoSeparados = separarTodosDigitosCartao(numCartao);
  int ultimoDigitoCartao = removeGuardaUltimoDigito(numCartaoSeparados);
  List<int> temporaria = multiplicaColunasCartao(numCartaoSeparados);
  List<int> valorSeparados = intParaStrings(temporaria);
  int restoDaDivisao = retornaRestoDivisao(valorSeparados);

  if (restoDaDivisao == ultimoDigitoCartao) {
    return "CARTAO VALIDO";
  } else {
    return "CARTÃO INVALIDO";
  }
}

int retornaRestoDivisao(List<int> valorSeparados) {
  int somaDigitosCartao = 0;

  for (var count in valorSeparados) {
    somaDigitosCartao += count;
  }
  int restoDaDivisao = somaDigitosCartao % 10;
  return restoDaDivisao;
}

int removeGuardaUltimoDigito(List<int> numCartaoSeparados) {
  int ultimoDigitoCartao = numCartaoSeparados[numCartaoSeparados.length - 1];
  numCartaoSeparados.removeAt(numCartaoSeparados.length - 1);
  return ultimoDigitoCartao;
}

List<int> intParaStrings(List<int> temporaria) {
  List<String> novosNumEmString =
      temporaria.map((value) => value.toString()).toList();

  String valorTemporario = novosNumEmString.join('');
  List<int> valoresSomados = separarTodosDigitosCartao(valorTemporario);
  return valoresSomados;
}

List<int> multiplicaColunasCartao(List<int> numCartaoSeparados) {
  List<int> temporaria = [];
  for (int i = 0; i < numCartaoSeparados.length; i++) {
    if (i % 2 == 0) {
      temporaria.add(numCartaoSeparados[i] * 2);
    } else {
      temporaria.add(numCartaoSeparados[i] * 1);
    }
  }

  return temporaria;
}

List<int> separarTodosDigitosCartao(String numCartao) {
  List<String> numerosSeparados = numCartao.split('');
  List<int> numCartaoSeparados = numerosSeparados.map(int.parse).toList();
  return numCartaoSeparados;
}
