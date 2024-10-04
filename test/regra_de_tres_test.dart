import 'package:moduloZero/regra_de_tres.dart';
import 'package:test/test.dart';

void main() {
  final reg = RegraDeTres();

  group("Test Regra de Tres", () {
    test('Regra de tres - Success Grupo1.1 ', () async {
      expect(reg.calculo(grupo12: 1440, grupo22: 1920,grupo21: 500),
          isA<double>());
    });
    test('Regra de tres - Success Grupo1.2 ', () async {
      expect(reg.calculo(grupo11: 407, grupo22: 1920,grupo21: 500),
          isA<double>());
    });
    test('Regra de tres - Success Grupo2.1 ', () async {
      expect(reg.calculo(grupo11: 407, grupo12: 1440, grupo22: 1920),
          isA<double>());
    });
    test('Regra de tres - Success Grupo2.2 ', () async {
      expect(reg.calculo(grupo11: 407, grupo12: 1440, grupo21: 1920),
          isA<double>());
    });
    test('Regra de tres - Error: No value empty', () async {
      expect(
          () => reg.calculo(
              grupo11: 407, grupo12: 1440, grupo22: 1920, grupo21: 400),
          throwsA(isA<Exception>().having(
            (error) => error.toString(),
            'message',
            contains("Você deve deixar um valor em branco para poder calcular"),
          )));
    });
    test('Regra de tres - Error: Has more than one empty value', () async {
      expect(
          () => reg.calculo(grupo11: 407, grupo12: 1440),
          throwsA(isA<Exception>().having((error) => error.toString(),
              'message', contains("Só pode deixar um valor em branco!"))));
    });
  });
}
