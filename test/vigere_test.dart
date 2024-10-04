import 'package:test/test.dart';
import 'package:moduloZero/vigere.dart';

void main() {
  group('Vigere Test', () {
    final cifra = VigereCifra();

    String texto = "ESTUDEMO23";
    String key = '6 +@0@S\$3I';

    test("Key Generator Sucess", () {
      expect(cifra.keyGenerator('AAAA'), isA<String>());
    });
    test("Key Generator Error", () {
      expect(() => cifra.keyGenerator('aeiou'), throwsA(isA<Exception>()));
    });

    test("Test Encode", () {
      String textCrypt = cifra.encode(texto, key);
      expect(textCrypt, 'TLXTMDEL23');
    });
    test("Test Decode", () {
      String textCrypt = 'TLXTMDEL23';

      String textDescrypto = cifra.decode(textCrypt, key);

      expect(textDescrypto, 'ESTUDEMO23');
    });
  });
}
