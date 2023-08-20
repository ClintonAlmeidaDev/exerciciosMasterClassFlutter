import 'dart:math';

class Vigenere {
  bool isAlfhabet(int charCode) {
    return (charCode >= 'A'.codeUnitAt(0) && charCode <= 'Z'.codeUnitAt(0));
  }

  String keyRandomica(String texto) {
    List<String> chaveRandomica = [];
    for (int i = 0; i < texto.length; i++) {
      int rand = Random().nextInt(89) + 33;
      String caracter = String.fromCharCode(rand);
      chaveRandomica.add(caracter);
    }
    return chaveRandomica.join();
  }

  String encode(String texto, String chaveRandomica) {
    List<String> palavraEncriptada = [];

    String textoMaiusculo = texto.toUpperCase();

    final charCode = textoMaiusculo.codeUnits;
    final charKey = chaveRandomica.codeUnits;
    int somaTextoCript;

    for (int i = 0; i < textoMaiusculo.length; i++) {
      somaTextoCript = 0;
      if (isAlfhabet(charCode[i])) {
        somaTextoCript = ((charCode[i] + charKey[i]) % 26) + 'A'.codeUnitAt(0);
        palavraEncriptada.add(String.fromCharCode(somaTextoCript));
      } else {
        palavraEncriptada.add(String.fromCharCode(charCode[i]));
      }
    }
    return palavraEncriptada.join();
  }

  String decode(String textoCriptografado, String chaveRandomica) {
    List<String> palavraDescriptografada = [];

    String textoMaiusculoCript = textoCriptografado.toUpperCase();

    final charCode = textoMaiusculoCript.codeUnits;
    final charKey = chaveRandomica.codeUnits;
    int somaTextoCript;

    for (int i = 0; i < textoMaiusculoCript.length; i++) {
      somaTextoCript = 0;
      if (isAlfhabet(charCode[i])) {
        somaTextoCript =
            (((charCode[i] - charKey[i]) + 26) % 26) + 'A'.codeUnitAt(0);
        palavraDescriptografada.add(String.fromCharCode(somaTextoCript));
      } else {
        palavraDescriptografada.add(String.fromCharCode(charCode[i]));
      }
    }
    return palavraDescriptografada.join();
  }
}

void main(List<String> args) {
  var vigenere = Vigenere();
  String texto = 'MASTER CLASS 9';
  String chave = vigenere.keyRandomica(texto);
  String textoCriptografado = vigenere.encode(texto, chave);
  String textoDescriptografado = vigenere.decode(textoCriptografado, chave);
  print("PALAVRA NORMAL: $texto");
  print("PALAVRA CHAVE: ${chave}");
  print("PALAVRA CRIPTOGRAFADA: $textoCriptografado");
  print("PALAVRA DESCRIPTOGRAFADA: ${textoDescriptografado}");
}
