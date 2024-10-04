import 'package:moduloZero/fibonacci.dart';
import 'package:test/test.dart';

void main() {
  final fib = Fibonacci();

  group("Test Fibonacci", () {
    test('Test Fibonacci 10 itens Success', () async {
      expect(fib.create(10), <int>[0, 1, 1, 2, 3, 5, 8, 13, 21, 34]);
    });
    test('Test Fibonacci 2 itens Success', () async {
      expect(fib.create(2), <int>[0, 1]);
    });
    test('Test Fibonacci Erro: Size < 2', () async {
      expect(() => fib.create(1), throwsA(isA<Exception>()));
    });
  });
}
