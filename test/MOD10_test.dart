import 'package:moduloZero/MOD10.dart';
import 'package:test/test.dart';

void main() {
  final mod10 = Mod10();
  group("Test MOD10 ", () {
    test("Test Card Valid", () {
      expect(mod10.validate("4916641859369080"), true);
    });
    test("Test Card False", () {
      expect(mod10.validate("5419825003461210"), false);
    });
    test("Test Card Error: Wrong card size", () {
      expect(() => mod10.validate("541982500346121078"),
          throwsA(isA<Exception>()));
    });
  });
}
