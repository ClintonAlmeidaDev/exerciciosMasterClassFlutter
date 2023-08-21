import 'dart:convert';
import 'dart:io';

class LoadEnv {
  final String nomeArquivo;

  LoadEnv(this.nomeArquivo);

  Map<String, dynamic> _valores = {};

  Future<Map> get valores async {
    await carregaEnv();
    return _valores;
  }

  void lerArquivo() {
    File(this.nomeArquivo).readAsString().then((String content) {
      print(content);
    });
  }

  Future<void> carregaEnv() async {
    final file = File(this.nomeArquivo);

    Stream<String> lines = file
        .openRead()
        .transform(utf8.decoder) // Decode bytes to UTF-8.
        .transform(LineSplitter()); // Convert stream to individual lines.
    try {
      await for (var line in lines) {
        separaChaveValor(line, this._valores);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void separaChaveValor(String line, Map<String, dynamic> valores) {
    List<String> partes = line.split('=');
    separaPorTipo(partes, valores);
  }

  void separaPorTipo(List<String> partes, Map<String, dynamic> valores) {
    if (partes.length == 2) {
      String chave = partes[0];
      String valor = partes[1];

      try {
        int valorInt = int.parse(valor);
        // print("INTEIRO");
        valores.addAll({chave: valorInt});
      } catch (e1) {
        try {
          double valorDouble = double.parse(valor);
          // print('DOUBLE');
          valores.addAll({chave: valorDouble});
        } catch (e2) {
          try {
            bool valorBolean = true;
            if (valor.toLowerCase() == 'true') {
              valorBolean = true;
              valores.addAll({chave: valorBolean});
              // print("BOOL - TRUE");
            } else if (valor.toLowerCase() == 'false') {
              valorBolean = false;
              valores.addAll({chave: valorBolean});
              // print("BOOL - FALSE");
            } else {
              // print("STRING");
              valores.addAll({chave: valor});
            }
          } catch (e3) {}
        }
      }
    }
  }
}

Future<void> main() async {
  var env = LoadEnv('.env');
  Map valores = await env.valores;
  print(valores['password']);
  print(valores['ano']);

  print(valores['validaCpf'] is bool);
}
