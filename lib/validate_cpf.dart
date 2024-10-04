class ValidateCpf {
  bool validate(String cpf) {
    if (cpf.length != 11) {
      throw Exception("CPF Deve conter 11 digitos");
    }
    String verificador1 = cpf[9];
    String verificador2 = cpf[10];

    String novePrimeiros = cpf.substring(0,9);
    String dezPrimeiros = cpf.substring(0,10);

    bool isTrueVerificador1 =
        verificarDigito(novePrimeiros, int.parse(verificador1));
    bool isTrueVerificador2 =
        verificarDigito(dezPrimeiros, int.parse(verificador2));

    if (isTrueVerificador1 && isTrueVerificador2) {
      return true;
    } else {
      return false;
    }
  }

  bool verificarDigito(String primeirosDigitos, int verificador) {
    int multi = 0;
    int numeroCrescente = 1;
    int resto = 0;
    int auxVerificador = 0;
    for (var i = primeirosDigitos.length - 1; i > 0; i--) {
      var digito = int.parse(primeirosDigitos[i]);
      numeroCrescente++;
      multi = multi + (digito * numeroCrescente);
    }
    resto = multi % 11;

    if (resto < 2) {
      auxVerificador = 0;
    } else {
      auxVerificador = 11 - resto;
    }
    if (auxVerificador == verificador) {
      return true;
    } else {
      return false;
    }
  }
}