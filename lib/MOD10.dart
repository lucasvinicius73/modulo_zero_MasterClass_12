class Mod10 {
  bool validate(String cartao) {
    if (cartao.length != 16) {
      throw Exception("O Cartão Deve conter 16 digitos");
    }

    int lastDig = int.parse(cartao[15]);
    int resto = 0;
    int somaTotal = somarValores(cartao);
    resto = somaTotal % 10;
    int digVerificar = resto > 0 ? 10 - resto : 0;

    if (digVerificar == lastDig) {
      return true;
    } else {
      return false;
    }
  }

  int somarValores(String coluna) {
    int somaTotal = 0;
    for (var i = 0; i < coluna.length - 1; i++) {
      int soma = 0;
      if ((i) % 2 == 0) {
        soma = int.parse(coluna[i]) * 2;
        if (soma > 9) {
          String aux = '$soma';
          soma = int.parse(aux[0]) + int.parse(aux[1]);
        }
      } else {
        soma = int.parse(coluna[i]);
      }
      somaTotal = somaTotal + soma;
    }
    return somaTotal;
  }
}

void main(List<String> args) {
  final mod10 = Mod10();

  bool isValid = mod10.validate("5419825003461210");

  print("O cartão é valido? R=$isValid");
}
