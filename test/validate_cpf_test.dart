import 'package:moduloZero/validate_cpf.dart';
import 'package:test/test.dart';

void main() {
  final validadeCPF = ValidateCpf();
  group("Validade CPF Test", () {
    test('Test CPF Validade - True', () async {
      String cpf = "01559434210";
      expect(validadeCPF.validate(cpf), true);
    });
    test('Test CPF Validade - False', () async {
      String cpf = "01559434222";
      expect(validadeCPF.validate(cpf), false);
    });
    test('Test CPF Validade - Error', () async {
      String cpf = "01559434";
      expect(() => validadeCPF.validate(cpf), throwsA(isA<Exception>()));
    });
  });
}
