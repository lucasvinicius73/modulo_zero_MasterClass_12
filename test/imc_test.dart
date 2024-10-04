import 'package:moduloZero/imc.dart';
import 'package:test/test.dart';

void main() {
  final imc = Imc();

  group("Test IMC", () {
    test('IMC Sucess', () async {
      expect(imc.calculo(peso: 106.5, altura: 1.8), 31);
    });
    test('IMC Error: Height', () async {
      expect(
          () => imc.calculo(peso: 106.5, altura: 0.5),
          throwsA(isA<Exception>().having((error) => error.toString(),
              "message", contains("Altura não pode ser menor que 1"))));
    });
    test('IMC Error: Weight', () async {
      expect(
          () => imc.calculo(peso: 0.5, altura: 1.8),
          throwsA(isA<Exception>().having((error) => error.toString(),
              "message", contains("Peso não pode ser menor que 1"))));
    });
  });
}
